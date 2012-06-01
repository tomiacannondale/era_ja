# -*- coding: utf-8 -*-
require "era_ja/version"
require 'date'

module EraJa
  ERA = [["M", "明治"], ["T", "大正"], ["S", "昭和"], ["H", "平成"]]

  def to_era(format = "%o%E.%m.%d")
    @era_format = format[/%o/i]
    if self.to_time < ::Time.mktime(1868,9,8)
      raise "#to_era is expeted later in 1968,9,8"
    elsif self.to_time < ::Time.mktime(1912,7,30)
      "#{format_era('M')}#{year - 1867}.#{month}.#{day}"
    elsif self.to_time < ::Time.mktime(1926,12,25)
      "#{format_era('T')}#{year - 1911}.#{month}.#{day}"
    elsif self.to_time < ::Time.mktime(1989,1,8)
      "#{format_era('S')}#{year - 1925}.#{month}.#{day}"
    else
      "#{format_era('H')}#{year - 1988}.#{month}.#{day}"
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

end
