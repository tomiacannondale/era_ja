# -*- coding: utf-8 -*-
require 'date'

module EraJa
  module Conversion
    ERA_NAME_DEFAULTS = {
      meiji:  ["M", "明治"],
      taisho: ["T", "大正"],
      showa:  ["S", "昭和"],
      heisei: ["H", "平成"]
    }

    ERR_DATE_OUT_OF_RANGE = "#to_era only works on dates after 1868,9,8"

    # Convert to Japanese era.
    # @param [String] format_string
    #   Time#strftime format string can be used
    #   #### extra format string
    #   * %o - era(alphabet)
    #   * %O - era(kanzi)
    #   * %E - era year
    #   * %J - kanzi number
    # @param [Hash] era_names
    #    If you want to convert custom to era strings (eg `平`, `h`), you can set this argument.
    #    key is `:meiji' or `:taisho' or `:showa` or `:heisei`.
    #    value is ["alphabet era name"(ex `h`, `s`)(related to `%o`), "multibyte era name"(eg `平`, `昭`)(related to `%O`)].
    #    this argument is same as one element of ERA_NAME_DEFAULTS.
    # @return [String]
    def to_era(format = "%o%E.%m.%d", era_names: ERA_NAME_DEFAULTS)
      @era_format = format.gsub(/%J/, "%J%")
      str_time = strftime(@era_format)
      if @era_format =~ /%E/
        if self.to_time < ::Time.mktime(1868,9,8)
          raise ERR_DATE_OUT_OF_RANGE
        elsif self.to_time < ::Time.mktime(1912,7,30)
          str_time = era_year(year - 1867, :meiji, era_names)
        elsif self.to_time < ::Time.mktime(1926,12,25)
          str_time = era_year(year - 1911, :taisho, era_names)
        elsif self.to_time < ::Time.mktime(1989,1,8)
          str_time = era_year(year - 1925, :showa, era_names)
        else
          str_time = era_year(year - 1988, :heisei, era_names)
        end
      end
      str_time.gsub(/%J(\d+)/) { to_kanzi($1) }
    end

    private
    def era_year(year, era, era_names)
      strftime(@era_format).sub(/(%J)?%E/) { format_year(year, $1) }.sub(/%1?o/i) { format_era(era, era_names) }
    end

    def format_era(era, era_names)
      if @era_format =~ /%o/
        era_names.fetch(era)[0]
      elsif @era_format =~ /%1O/
        era_names.fetch(era)[1][0]
      elsif @era_format =~ /%O/
        era_names.fetch(era)[1]
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
