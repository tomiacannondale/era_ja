module EraJa
  class DateOutOfRangeError < StandardError
    ERR_DATE_OUT_OF_RANGE = "#to_era only works on dates after 1868,9,8".freeze

    def message
      ERR_DATE_OUT_OF_RANGE
    end
  end
end
