# EraJa [![Build Status](https://travis-ci.org/tomiacannondale/era_ja.svg)](https://travis-ci.org/tomiacannondale/era_ja)

日本の和暦に変換します。

## Installation

以下のコードをアプリケーションのGemfileに追記します。

    gem 'era_ja'

そして、以下をのコマンドを実行します。

    $ bundle

もしくは

    $ gem install era_ja

### ruby version ###

[.travis.yml](https://github.com/tomiacannondale/era_ja/blob/master/.travis.yml ) を確認してください。

**NOTE** :: era_ja0.4.0からruby1.9.3をサポートしていません。

## Usage

### フォーマット文字列

引数としてstrftimeのフォーマット文字列を使用出来ます。

EraJa#to_eraメソッドでの追加のフォーマット文字列は以下の通りです。

* %o:  元号(アルファベット)
* %O:  元号(漢字)
* %1O: 元号(漢字1文字)
* %E:  元号の年
* %-E: 元号の年(1から9まで1ケタ)
* %K:  元号の年(漢数字) 2年目以降は数字
* %J:  漢数字

### Timeインスタンスを和暦に変換します。

```ruby
require 'era_ja'
Time.mktime(2012,4,29).to_era   # => "H24.04.29"
Time.mktime(2012,4,29).to_era("%O%E年%-m月%d日") # => "平成24年4月29日"
Time.mktime(2012,4,29).to_era("%O%JE年%Jm月%Jd日") # => "平成二十四年四月二十九日"
```

### Dateインタンスを和暦に変換します。

```ruby
require 'era_ja
Date.new(2012,4,29).to_era     # => "H24.04.29"
Date.new(2012,4,29).to_era("%O%E年%-m月%d日") # => "平成24年4月29日"
Date.new(2012,4,29).to_era("%O%JE年%Jm月%Jd日") # => "平成二十四年四月二十九日"
```

### 数字を漢数字に変換します。 ###


```ruby
Time.mktime(2012,4,29).to_era("%JY年%Jm月%Jd日") # => "二千十二年四月二十九日"
Date.new(2012,4,29).to_era("%JY年%Jm月%Jd日")    # => "二千十二年四月二十九日"
```

もし１年目の場合は `元` ２年目以降を数字にしたい場合は `%K` を使用することができます。

```ruby
Time.mktime(2019,5,1).to_era("%O%KE年%m月%d日") # => "令和元年05月01日"
Time.mktime(2020,5,1).to_era("%O%KE年%m月%d日") # => "令和02年05月01日"
Date.new(2019,5,1).to_era("%O%KE年%m月%d日") # => "令和元年05月01日"
Date.new(2020,5,1).to_era("%O%KE年%m月%d日") # => "令和02年05月01日"
```

### Era names ###

もし１桁の元号文字列でコンバートしたい場合、 `%1O` を使用することができます。

```ruby
require 'era_ja'
Time.mktime(2012,4,29).to_era("%1O%E年%m月%d日") # => "平24年4月29日"
```

もしデフォルトの元号文字列以外の文字列でコンバートしたい場合、 `era_names` を使用することができます。

```ruby
require 'era_ja'
Time.mktime(2012,4,29).to_era(era_names: { heisei: ['h', '平'] })                       # => "h24.04.29"
Time.mktime(2012,4,29).to_era("%O%E年%-m月%d日", era_names: { heisei: ['h', '平'] })     # => "平24年4月29日"
Time.mktime(2012,4,29).to_era("%O%JE年%Jm月%Jd日", era_names: { heisei: ['h', '平'] })   # => "平二十四年四月二十九日"
# same as Date
```

### 元号に変換できるかどうかの判定方法 ###

日付が元号に変換できるかどうかを判定するために、`era_convertible?` を使うことができます。

```ruby
require 'era_ja'
Time.mktime(1868,9,7).era_convertible? #=> false
Time.mktime(1868,9,8).era_convertible? #=> true
```

元号に変換できない日付に関しては、[Noteセクション](#note) を参照してください。

## Support

問題を報告したり、機能追加の要望する場合はgithubのIssuesに登録してください。 https://github.com/tomiacannondale/era_ja/issues

## Contributing

1. フォークして
2. feature branchを作成して (`git checkout -b my-new-feature`)
3. 変更をコミットして (`git commit -am 'Added some feature'`)
4. ブランチをプッシュして (`git push origin my-new-feature`)
5. プルリクエストをください

## Note

元号については以下の問題点があります。

* 明治の開始を1868年9月8日としていますが旧暦での日付です。
* 大正、昭和の開始日はそれぞれ明治、大正の最終日と同日です。
  * [昭和ト改元](http://ja.wikisource.org/wiki/%e6%98%ad%e5%92%8c%e3%83%88%e6%94%b9%e5%85%83)
  * [大正十五年十二月ニ十五日以後ヲ改メテ昭和元年ト爲ス](http://ja.wikisource.org/wiki/%e5%a4%a7%e6%ad%a3%e5%8d%81%e4%ba%94%e5%b9%b4%e5%8d%81%e4%ba%8c%e6%9c%88%e3%83%8b%e5%8d%81%e4%ba%94%e6%97%a5%e4%bb%a5%e5%be%8c%e3%83%b2%e6%94%b9%e3%83%a1%e3%83%86%e6%98%ad%e5%92%8c%e5%85%83%e5%b9%b4%e3%83%88%e7%88%b2%e3%82%b9)
  * [明治45年（1912）7月｜大正と改元：日本のあゆみ](http://www.archives.go.jp/ayumi/kobetsu/m45_1912_01.html)

## Author

tomi tomiacannondale@gmail.com

## License

MITライセンスです。詳細は LICENSE を参照してください。
