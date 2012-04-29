# EraJa

Convert to Japanese era.

## Installation

Add this line to your application's Gemfile:

    gem 'era_ja'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install era_ja

## Usage

### Time instance to japanese era

```ruby
	Time.mktime(2012,4,29).to_era   # => "H24.4.29"
```

### Date instance to japanese era

```ruby
	Date.new(2012,4,29).to_era     # => "H24.4.29"
```

## Support

Report issues and feature requests to github Issues. https://github.com/tomiacannondale/era_ja/issues

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Note

I think about the era and there is a problem in the following.

* The date in the lunar calendar Although it is September 8, 1968 the start of the Meiji era.
* Start date Taisho, Showa is the same day as the last day of the Meiji, Taisho, respectively.
  * [昭和ト改元](http://ja.wikisource.org/wiki/%e6%98%ad%e5%92%8c%e3%83%88%e6%94%b9%e5%85%83)
  * [大正十五年十二月ニ十五日以後ヲ改メテ昭和元年ト爲ス](http://ja.wikisource.org/wiki/%e5%a4%a7%e6%ad%a3%e5%8d%81%e4%ba%94%e5%b9%b4%e5%8d%81%e4%ba%8c%e6%9c%88%e3%83%8b%e5%8d%81%e4%ba%94%e6%97%a5%e4%bb%a5%e5%be%8c%e3%83%b2%e6%94%b9%e3%83%a1%e3%83%86%e6%98%ad%e5%92%8c%e5%85%83%e5%b9%b4%e3%83%88%e7%88%b2%e3%82%b9)
  * [明治45年（1912）7月｜大正と改元：日本のあゆみ](http://www.archives.go.jp/ayumi/kobetsu/m45_1912_01.html)

## Author

tomi tomiacannondale@gmail.com

## License

MIT License. For more imformation, please see LICENSE.
