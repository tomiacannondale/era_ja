# -*- coding: utf-8 -*-
require 'rspec'

RSpec.shared_examples "should equal 'H24.04.29'" do
  it { expect(subject.to_era).to eq "H24.04.29" }

  context "with '%o%E.%m.%d'" do
    it { expect(subject.to_era("%o%E.%m.%d")).to eq "H24.04.29" }
  end
end

RSpec.shared_examples "should equal 'h24.04.29'" do
  context "with era_names option" do
    context "when era_names is correct" do
      let(:era_names) { { heisei: ["h", "平成"] } }
      it { expect(subject.to_era(era_names: era_names)).to eq "h24.04.29" }
    end

    context "when era_names have no heisei values" do
      let(:era_names) { { showa: ["s", "昭和"] } }
      it { expect { subject.to_era(era_names: era_names) }.to raise_error(KeyError) }
    end
  end

  context "with '%o%E.%m.%d' and era_names option" do
    let(:era_names) { { heisei: ["h", "平成"] } }
    it { expect(subject.to_era("%o%E.%m.%d", era_names: era_names)).to eq "h24.04.29" }
  end
end

RSpec.shared_examples "should equal '平成24年04月29日'" do
  context "with '%O%E年%m月%d日'" do
    it { expect(subject.to_era("%O%E年%m月%d日")).to eq "平成24年04月29日" }
  end
end

RSpec.shared_examples "should equal '平24年04月29日'" do
  context "with '%1O%E年%m月%d日'" do
    it { expect(subject.to_era("%1O%E年%m月%d日")).to eq "平24年04月29日" }
  end
end

RSpec.shared_examples "should equal '24.04.29'" do
  context "with '%E.%m.%d'" do
    it { expect(subject.to_era("%E.%m.%d")).to eq "24.04.29" }
  end
end

RSpec.shared_examples "should equal '2404'" do
  context "with '%E%m'" do
    it { expect(subject.to_era("%E%m")).to eq "2404" }
  end
end

RSpec.shared_examples "should equal '平成240429'" do
  context "with '%O%E%m%d'" do
    it { expect(subject.to_era("%O%E%m%d")).to eq '平成240429' }
  end
end

RSpec.shared_examples "should equal '平240429'" do
  context "with '%O%E%m%d' and era_names option" do
    let(:format) { "%O%E%m%d" }

    context "when era_names is correct" do
      let(:era_names) { { heisei: ["H", "平"] } }
      it { expect(subject.to_era(format, era_names: era_names)).to eq '平240429' }
    end

    context "when era_names have no heisei values" do
      let(:era_names) { { showa: ["S", "昭"] } }
      it { expect { subject.to_era(format, era_names: era_names) }.to raise_error(KeyError) }
    end
  end
end

RSpec.shared_examples "should equal '平成31.04.30'" do
  it { expect(subject.to_era("%O%E.%m.%d")).to eq "平成31.04.30" }
end

RSpec.shared_examples "should equal '平31.04.30'" do
  it { expect(subject.to_era("%1O%E.%m.%d")).to eq "平31.04.30" }
end

RSpec.shared_examples "should equal 'H31.04.30'" do
  it { expect(subject.to_era).to eq "H31.04.30" }
end

RSpec.shared_examples "should equal '平成二十四年四月二十九日'" do
  context "with '%O%JE年%Jm月%Jd日'" do
    it { expect(subject.to_era('%O%JE年%Jm月%Jd日')).to eq '平成二十四年四月二十九日' }
  end
end

RSpec.shared_examples "should equal '2012年04月29日'" do
  context "with '%y年%m月%d日'" do
    it { expect(subject.to_era('%Y年%m月%d日')).to eq '2012年04月29日' }
  end
end

RSpec.shared_examples "should equal '二千十二年四月二十九日'" do
  context "with '%JY年%Jm月%Jd日'" do
    it { expect(subject.to_era('%JY年%Jm月%Jd日')).to eq '二千十二年四月二十九日' }
  end
end

RSpec.shared_examples "should equal '平成'" do
  context "with '%O'" do
    it { expect(subject.to_era('%O')).to eq '平成' }
  end
end

RSpec.shared_examples "should equal '平'" do
  context "with '%1O'" do
    it { expect(subject.to_era('%1O')).to eq '平' }
  end
end

RSpec.shared_examples "should equal 'H'" do
  context "with '%o'" do
    it { expect(subject.to_era('%o')).to eq 'H' }
  end
end

RSpec.shared_examples "should equal 'H01.01.08'" do
  context "without argument" do
    it { expect(subject.to_era).to eq "H01.01.08" }
  end

  context "with '%O%JE.%Jm.%Jd'" do
    it { expect(subject.to_era('%O%JE.%Jm.%Jd')).to eq "平成元.一.八" }
  end
end

RSpec.shared_examples "should equal 'S64.01.07'" do
  it { expect(subject.to_era).to eq "S64.01.07" }
end

RSpec.shared_examples "should equal '昭和64.01.07'" do
  it { expect(subject.to_era("%O%E.%m.%d")).to eq "昭和64.01.07" }
end

RSpec.shared_examples "should equal '昭64.01.07'" do
  it { expect(subject.to_era("%1O%E.%m.%d")).to eq "昭64.01.07" }
end

RSpec.shared_examples "should equal 'S01.12.25'" do
  it { expect(subject.to_era).to eq "S01.12.25" }
end

RSpec.shared_examples "should equal 'T15.12.24'" do
  it { expect(subject.to_era).to eq "T15.12.24" }
end

RSpec.shared_examples "should equal 'T01.07.30'" do
  it { expect(subject.to_era).to eq "T01.07.30" }
end

RSpec.shared_examples "should equal '大正01.07.30'" do
  it { expect(subject.to_era("%O%E.%m.%d")).to eq "大正01.07.30" }
end

RSpec.shared_examples "should equal '大01.07.30'" do
  it { expect(subject.to_era("%1O%E.%m.%d")).to eq "大01.07.30" }
end

RSpec.shared_examples "should equal 'M45.07.29'" do
  it { expect(subject.to_era).to eq "M45.07.29" }
end

RSpec.shared_examples "should equal '明治45.07.29'" do
  it { expect(subject.to_era("%O%E.%m.%d")).to eq "明治45.07.29" }
end

RSpec.shared_examples "should equal '明45.07.29'" do
  it { expect(subject.to_era("%1O%E.%m.%d")).to eq "明45.07.29" }
end

RSpec.shared_examples "should equal 'M01.09.08'" do
  it { expect(subject.to_era).to eq "M01.09.08" }
end

RSpec.shared_examples "should raise error" do
  it { expect {subject.to_era}.to raise_error(RuntimeError, EraJa::Conversion::ERR_DATE_OUT_OF_RANGE) }
end

RSpec.shared_examples "2019,5,1" do
  include_examples "should raise error"
end

# RSpec.shared_examples "2019,4,30" do
#   include_examples "should equal 'H31.04.30'"
# end

RSpec.shared_examples "2019,4,30" do
  include_examples "should equal 'H31.04.30'"
  include_examples "should equal '平成31.04.30'"
  include_examples "should equal '平31.04.30'"
end

RSpec.shared_examples "2012,4,29" do
  include_examples "should equal 'H24.04.29'"
  include_examples "should equal 'h24.04.29'"
  include_examples "should equal '平成24年04月29日'"
  include_examples "should equal '平24年04月29日'"
  include_examples "should equal '24.04.29'"
  include_examples "should equal '2404'"
  include_examples "should equal '平成240429'"
  include_examples "should equal '平240429'"
  include_examples "should equal '2012年04月29日'"
  include_examples "should equal '平成二十四年四月二十九日'"
  include_examples "should equal '二千十二年四月二十九日'"
  include_examples "should equal '平成'"
  include_examples "should equal '平'"
  include_examples "should equal 'H'"
end

RSpec.shared_examples "1989,1,8" do
  include_examples "should equal 'H01.01.08'"
end

RSpec.shared_examples "1989,1,7" do
  include_examples "should equal 'S64.01.07'"
  include_examples "should equal '昭和64.01.07'"
  include_examples "should equal '昭64.01.07'"
end

RSpec.shared_examples "1926,12,25" do
  include_examples "should equal 'S01.12.25'"
end

RSpec.shared_examples "1926,12,24" do
  include_examples "should equal 'T15.12.24'"
end

RSpec.shared_examples "1912,7,30" do
  include_examples "should equal 'T01.07.30'"
  include_examples "should equal '大正01.07.30'"
  include_examples "should equal '大01.07.30'"
end

RSpec.shared_examples "1912,7,29" do
  include_examples "should equal 'M45.07.29'"
  include_examples "should equal '明治45.07.29'"
  include_examples "should equal '明45.07.29'"
end

RSpec.shared_examples "1868,9,8" do
  include_examples "should equal 'M01.09.08'"
end

RSpec.shared_examples "1868,9,7" do
  include_examples "should raise error"
end
