# -*- coding: utf-8 -*-
require "era_ja/version"
require 'date'

module EraJa
  ERA = [["M", "明治"], ["T", "大正"], ["S", "昭和"], ["H", "平成"]]

  # Convert to Japanese era.
  # @param [String] format_string
  #   Time#strftime format string can be used
  #   #### extra format string
  #   * %o - era(alphabet)
  #   * %O - era(kanzi)
  #   * %E - era year
  # @return [String]
  def to_era(format = "%o%E.%m.%d")
    format.sub!(/%o/i) { |m| m + ' ' }
    @era_format = format[/%o/i]
    if self.to_time < ::Time.mktime(1868,9,8)
      raise "#to_era is expeted later in 1968,9,8"
    elsif self.to_time < ::Time.mktime(1912,7,30)
      strftime(format).sub(/%E/, format_year(year - 1867)).sub(/%o /i) { format_era('M') }
    elsif self.to_time < ::Time.mktime(1926,12,25)
      strftime(format).sub(/%E/, format_year(year - 1911)).sub(/%o /i) { format_era('T') }
    elsif self.to_time < ::Time.mktime(1989,1,8)
      strftime(format).sub(/%E/, format_year(year - 1925)).sub(/%o /i) { format_era('S') }
    else
      strftime(format).sub(/%E/, format_year(year - 1988)).sub(/%o /i) { format_era('H') }
    end
  end

  private
  def format_era(string)
    if @era_format == "%o"
      return "#{ERA.detect{ |i| i[0] == string}[0]}"
    elsif @era_format == "%O"
      return "#{ERA.detect{ |i| i[0] == string}[1]}"
    end
  end

  def format_year(year)
    sprintf("%02d", year)
  end

end
