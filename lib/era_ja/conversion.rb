# -*- coding: utf-8 -*-
require 'date'

module EraJa
  module Conversion
    ERA = [["M", "明治"], ["T", "大正"], ["S", "昭和"], ["H", "平成"]]

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
        if self.to_time < ::Time.mktime(1868,9,8)
          raise "#to_era is expeted later in 1868,9,8"
        elsif self.to_time < ::Time.mktime(1912,7,30)
          str_time = era_year(year - 1867, 'M')
        elsif self.to_time < ::Time.mktime(1926,12,25)
          str_time = era_year(year - 1911, 'T')
        elsif self.to_time < ::Time.mktime(1989,1,8)
          str_time = era_year(year - 1925, 'S')
        else
          str_time = era_year(year - 1988, 'H')
        end
      end
      str_time.gsub(/%J(\d+)/) { to_kanzi($1) }
    end

    private
    def era_year(year, era)
      strftime(@era_format).sub(/(%J)?%E /) { format_year(year, $1) }.sub(/%o /i) { format_era(era) }
    end

    def format_era(string)
      if @era_format =~ /%o/
        return "#{ERA.detect{ |i| i[0] == string}[0]}"
      elsif @era_format =~ /%O/
        return "#{ERA.detect{ |i| i[0] == string}[1]}"
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
