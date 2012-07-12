# -*- coding: utf-8 -*-
require 'rspec'

shared_examples "should equal 'H24.04.29'" do
  it { subject.to_era.should eq "H24.04.29" }

  context "with '%o%E.%m.%d'" do
    it { subject.to_era("%o%E.%m.%d").should eq "H24.04.29" }
  end
end

shared_examples "should equal '平成24年04月29日'" do
  context "with '%O%E年%m月%d日'" do
    it { subject.to_era("%O%E年%m月%d日").should eq "平成24年04月29日" }
  end
end

shared_examples "should equal '24.04.29'" do
  context "with '%E.%m.%d'" do
    it { subject.to_era("%E.%m.%d").should eq "24.04.29" }
  end
end

shared_examples "should equal '2404'" do
  context "with '%E%m'" do
    it { subject.to_era("%E%m").should eq "2404" }
  end
end

shared_examples "should equal '平成240429'" do
  context "with '%O%E%m%d'" do
    it { subject.to_era("%O%E%m%d").should eq '平成240429' }
  end
end

shared_examples "should equal 'H01.01.08'" do
  it { subject.to_era.should eq "H01.01.08" }
end

shared_examples "should equal 'S64.01.07'" do
  it { subject.to_era.should eq "S64.01.07" }
end

shared_examples "should equal '昭和64.01.07'" do
  it { subject.to_era("%O%E.%m.%d").should eq "昭和64.01.07" }
end

shared_examples "should equal 'S01.12.25'" do
  it { subject.to_era.should eq "S01.12.25" }
end

shared_examples "should equal 'T15.12.24'" do
  it { subject.to_era.should eq "T15.12.24" }
end

shared_examples "should equal 'T01.07.30'" do
  it { subject.to_era.should eq "T01.07.30" }
end

shared_examples "should equal '大正01.07.30'" do
  it { subject.to_era("%O%E.%m.%d").should eq "大正01.07.30" }
end

shared_examples "should equal 'M45.07.29'" do
  it { subject.to_era.should eq "M45.07.29" }
end

shared_examples "should equal '明治45.07.29'" do
  it { subject.to_era("%O%E.%m.%d").should eq "明治45.07.29" }
end

shared_examples "should equal 'M01.09.08'" do
  it { subject.to_era.should eq "M01.09.08" }
end


shared_examples "2012,4,29" do
  include_examples "should equal 'H24.04.29'"
  include_examples "should equal '平成24年04月29日'"
  include_examples "should equal '24.04.29'"
  include_examples "should equal '2404'"
  include_examples "should equal '平成240429'"
end

shared_examples "1989,1,8" do
  include_examples "should equal 'H01.01.08'"
end

shared_examples "1989,1,7" do
  include_examples "should equal 'S64.01.07'"
  include_examples "should equal '昭和64.01.07'"
end

shared_examples "1926,12,25" do
  include_examples "should equal 'S01.12.25'"
end

shared_examples "1926,12,24" do
  include_examples "should equal 'T15.12.24'"
end

shared_examples "1912,7,30" do
  include_examples "should equal 'T01.07.30'"
  include_examples "should equal '大正01.07.30'"
end

shared_examples "1912,7,29" do
  include_examples "should equal 'M45.07.29'"
  include_examples "should equal '明治45.07.29'"
end

shared_examples "1868,9,8" do
  include_examples "should equal 'M01.09.08'"
end
