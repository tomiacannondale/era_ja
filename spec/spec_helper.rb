# -*- coding: utf-8 -*-
require 'rspec'

shared_examples "should equal 'H24.4.29'" do
  it { subject.should eq "H24.4.29" }
end

shared_examples "should equal 'H1.1.8'" do
  it { subject.should eq "H1.1.8" }
end

shared_examples "should equal 'S64.1.7'" do
  it { subject.should eq "S64.1.7" }
end

shared_examples "should equal 'S1.12.25'" do
  it { subject.should eq "S1.12.25" }
end

shared_examples "should equal 'T15.12.24'" do
  it { subject.should eq "T15.12.24" }
end

shared_examples "should equal 'T1.7.30'" do
  it { subject.should eq "T1.7.30" }
end

shared_examples "should equal 'M45.7.29'" do
  it { subject.should eq "M45.7.29" }
end

shared_examples "should equal 'M1.9.8'" do
  it { subject.should eq "M1.9.8" }
end
