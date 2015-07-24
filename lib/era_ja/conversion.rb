# -*- coding: utf-8 -*-
require 'date'

module EraJa
  module Conversion
    ERA = {
      'M' => ["明治", ::Time.mktime(1868,9,8)],
      'T' => ["大正", ::Time.mktime(1912,7,30)],
      'S' => ["昭和", ::Time.mktime(1926,12,25)],
      'H' => ["平成", ::Time.mktime(1989,1,8)]
    }.freeze

    # Convert to Japanese era.
    # @param [String] format_string
    #   Time#strftime format string can be used
    #   #### extra format string
    #   * %o - era(alphabet)
    #   * %O - era(kanzi)
    #   * %E - era year
    #   * %J - kanzi number
    # @return [String]
    def to_era(format = "%o%E.%m.%d")
      @era_format = format
      @era_format.gsub!(/%J/, "%J%")
      @era_format.sub!(/%o/i) { |m| m + ' ' }
      @era_format.sub!(/%E/) { |m| m + ' ' }
      str_time = strftime(@era_format)
      if @era_format =~ /%E/
        str_time = era_year_str(*era_year)
      end
      str_time.gsub(/%J(\d+)/) { to_kanzi($1) }
    end
    
    # Get Japanese year.
    # @return [String, Fixnum] (era_alphabet, era_num)
    def era_year
      checked_era = nil
      checked_era_start = nil
      ERA.each_pair do |key, arr|
        _ , start = arr
        if self.to_time < start
          raise "era_ja gem does'n t work before September 7, 1868." unless checked_era
          break
        end
        checked_era = key
        checked_era_start = start
      end
      [checked_era, year - checked_era_start.year + 1]
    end

    private
    def era_year_str(era, year)
      strftime(@era_format).sub(/(%J)?%E /) { format_year(year, $1) }.sub(/%o /i) { format_era(era) }
    end

    def format_era(string)
      if @era_format =~ /%o/
        return string
      elsif @era_format =~ /%O/
        return "#{ERA[string][0]}"
      end
    end

    def format_year(year, match)
      era_year = sprintf("%02d", year)
      if match == "%J"
        era_year = year == 1 ? "元" : to_kanzi(era_year)
      end
      era_year
    end

    def to_kanzi(numeric, kanzi = "")
      figures = (10 ** numeric.to_s.size) / 10
      numeric = numeric.to_i
      kanzi_string = [nil, "一", "二", "三", "四", "五", "六", "七", "八", "九"]
      figures_string = { 1000 => "千", 100 => "百", 10 => "十", 1 => "" }
      return kanzi + kanzi_string[numeric] if figures == 1

      numeral = numeric / figures
      if numeral > 1
        to_kanzi(numeric - numeral * figures, "#{kanzi}#{kanzi_string[numeral]}#{figures_string[figures]}")
      elsif numeral == 1
        to_kanzi(numeric - numeral * figures, "#{kanzi}#{figures_string[figures]}")
      else
        to_kanzi(numeric - numeral * figures, kanzi)
      end
    end
  end
end
