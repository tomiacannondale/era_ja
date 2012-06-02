# -*- coding: utf-8 -*-
require File.expand_path('../lib/era_ja/time', File.dirname(__FILE__))
require File.expand_path('spec_helper', File.dirname(__FILE__))

describe Time do
  describe "#to_era" do

    context "time is 2012,4,29" do
      subject { Time.mktime(2012,4,29) }
      include_examples "2012,4,29"
    end

    context "time is 1989,1,8" do
      subject { Time.mktime(1989,1,8) }

      include_examples "1989,1,8"
    end

    context "time is 1989,1,7" do
      subject { Time.mktime(1989,1,7) }
      include_examples "1989,1,7"
    end

    context "time is 1926,12,25" do
      subject { Time.mktime(1926,12,25) }
      include_examples "1926,12,25"
    end

    context "time is 1926,12,24" do
      subject { Time.mktime(1926,12,24) }
      include_examples "1926,12,24"
    end

    context "time is 1912,7,30" do
      subject { Time.mktime(1912,7,30) }
      include_examples "1912,7,30"
    end

    context "time is 1912,7,29" do
      subject { Time.mktime(1912,7,29) }
      include_examples "1912,7,29"
    end

    context "time is 1868,9,8" do
      subject { Time.mktime(1868,9,8) }
      include_examples "1868,9,8"
    end

    context "time is 1868,9,7" do
      it { expect { Time.mktime(1868,9,7).to_era }.
        to raise_error(RuntimeError, "#to_era is expeted later in 1968,9,8") }
    end

  end
end
