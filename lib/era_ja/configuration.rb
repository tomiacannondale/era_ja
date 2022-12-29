module EraJa
  class Configuration
    # format %J only first year
    # Defaults to `false`
    # ```
    # Date.new(2019,5,1).to_era("%O%J-E年%-m月%-d日") #=> 令和元年5月1日
    # Date.new(2020,1,1).to_era("%O%J-E年%-m月%-d日") #=> 令和2年1月1日
    # ```
    # @return [Boolean]
    attr_accessor :format_era_only_first_year_kanji

    def initialize
      @format_era_only_first_year_kanji = false
    end
  end

  # @return [EraJa::Configuration] EraJa's current configuration
  def self.configuration
    @configuration ||= Configuration.new
  end

  # Set EraJa's configuration
  # @param config [EraJa::Configuration]
  def self.configuration=(config)
    @configuration = config
  end

  # Modify EraJa's current configuration
  # @yield param [EraJa::Configuration] config current EraJa config
  # ```
  # EraJa.configure do |config|
  #   config.format_era_only_first_year_kanji = false
  # end
  # ```
  def self.configure
    yield configuration
  end
end
