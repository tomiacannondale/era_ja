# -*- mode: ruby -*-
# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'rspec', :version => 2, :cli => '--color', :all_after_pass => false do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/era_ja/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
  watch('lib/era_ja.rb')     { "spec" }
  watch('spec/spec_helper.rb')  { "spec" }
end
