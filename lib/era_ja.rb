# -*- coding: utf-8 -*-
require "era_ja/version"
require 'date'

module EraJa
  def to_era
    if self.to_time < ::Time.mktime(1868,9,8)
      raise "#to_era is expeted later in 1968,9,8"
    elsif self.to_time < ::Time.mktime(1912,7,30)
      "M#{year - 1867}.#{month}.#{day}"
    elsif self.to_time < ::Time.mktime(1926,12,25)
      "T#{year - 1911}.#{month}.#{day}"
    elsif self.to_time < ::Time.mktime(1989,1,8)
      "S#{year - 1925}.#{month}.#{day}"
    else
      "H#{year - 1988}.#{month}.#{day}"
    end
  end
end
