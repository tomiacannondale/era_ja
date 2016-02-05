# EraJa [![Build Status](https://travis-ci.org/tomiacannondale/era_ja.svg)](https://travis-ci.org/tomiacannondale/era_ja)

Convert to Japanese era.

## Installation

Add this line to your application's Gemfile:

    gem 'era_ja'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install era_ja

### ruby version ###

See [.travis.yml](https://github.com/tomiacannondale/era_ja/blob/master/.travis.yml )

**NOTE** :: era_ja does not support ruby 1.9.3 since 0.4.0

## Usage

### format string

strftime format string can be used as an argument.

Extra format strings provided by EraJa#to_era are:

* %o:  era(alphabet)
* %O:  era(kanzi)
* %1O: era(single kanzi)
* %E:  era year
* %J:  kanzi numeral

### Time instance to Japanese era

```ruby
require 'era_ja'
Time.mktime(2012,4,29).to_era   # => "H24.4.29"
Time.mktime(2012,4,29).to_era("%O%E年%m月%d日") # => "平成24年4月29日"
Time.mktime(2012,4,29).to_era("%O%JE年%Jm月%Jd日") # => "平成二十四年四月二十九日"
```

### Date instance to Japanese era

```ruby
require 'era_ja'
Date.new(2012,4,29).to_era     # => "H24.4.29"
Date.new(2012,4,29).to_era("%O%E年%m月%d日") # => "平成24年4月29日"
Date.new(2012,4,29).to_era("%O%JE年%Jm月%Jd日") # => "平成二十四年四月二十九日"
```

### Convert numerals to kanzi ###

```ruby
Time.mktime(2012,4,29).to_era("%Jy年%Jm月%Jd日") # => "二千十二年四月二十九日"
Date.new(2012,4,29).to_era("%Jy年%Jm月%Jd日")    # => "二千十二年四月二十九日"
```

### Era names ###

To convert to single kanji era strings, you can use `%1O`.

```ruby
require 'era_ja'
Time.mktime(2012,4,29).to_era("%1O%E年%m月%d日") # => "平24年4月29日"
```

To convert to custom era strings, you can set `era_names` .

```ruby
require 'era_ja'
Time.mktime(2012,4,29).to_era(era_names: { heisei: ['h', '平'] })                       # => "h24.4.29"
Time.mktime(2012,4,29).to_era("%O%E年%m月%d日", era_names: { heisei: ['h', '平'] })     # => "平24年4月29日"
Time.mktime(2012,4,29).to_era("%O%JE年%Jm月%Jd日", era_names: { heisei: ['h', '平'] })  # => "平二十四年四月二十九日"
# same as Date
```

## Support

Report issues and feature requests to github Issues. https://github.com/tomiacannondale/era_ja/issues

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Note

The following issues exist regarding era:

* The Meiji era starts at September 8, 1866, but that date is in the old Japanese lunar calendar.
* The start dates of the Taisho and Showa eras are the same as the end dates of the Meiji and Taisho eras respectively.
  * [昭和ト改元](http://ja.wikisource.org/wiki/%e6%98%ad%e5%92%8c%e3%83%88%e6%94%b9%e5%85%83)
  * [大正十五年十二月ニ十五日以後ヲ改メテ昭和元年ト爲ス](http://ja.wikisource.org/wiki/%e5%a4%a7%e6%ad%a3%e5%8d%81%e4%ba%94%e5%b9%b4%e5%8d%81%e4%ba%8c%e6%9c%88%e3%83%8b%e5%8d%81%e4%ba%94%e6%97%a5%e4%bb%a5%e5%be%8c%e3%83%b2%e6%94%b9%e3%83%a1%e3%83%86%e6%98%ad%e5%92%8c%e5%85%83%e5%b9%b4%e3%83%88%e7%88%b2%e3%82%b9)
  * [明治45年（1912）7月｜大正と改元：日本のあゆみ](http://www.archives.go.jp/ayumi/kobetsu/m45_1912_01.html)

## Author

tomi tomiacannondale@gmail.com

## License

MIT License. For more information, please see LICENSE.
