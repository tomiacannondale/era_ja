require File.expand_path('../lib/era_ja/configuration', File.dirname(__FILE__))
require File.expand_path('spec_helper', File.dirname(__FILE__))

describe EraJa::Configuration do
  let(:config) { EraJa.configuration }

  context "when format_era_only_first_year_kanji is set to true" do
    it "returns true" do
      EraJa.configure { |config| config.format_era_only_first_year_kanji = true }
      expect(EraJa.configuration.format_era_only_first_year_kanji).to eq true
    end
  end

  context "when format_era_only_first_year_kanji is not specified" do
    it "defaults to false" do
      expect(EraJa.configuration.format_era_only_first_year_kanji).to eq false
    end
  end
end
