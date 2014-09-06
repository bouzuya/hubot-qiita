# hubot-qiita

A Hubot script that search from Qiita.

![](http://img.f.hatena.ne.jp/images/fotolife/b/bouzuya/20140906/20140906172741.gif)

## Installation

    $ npm install git://github.com/bouzuya/hubot-qiita.git

or

    $ # TAG is the package version you need.
    $ npm install 'git://github.com/bouzuya/hubot-qiita.git#TAG'

## Example

    bouzuya> hubot help qiita
      hubot> hubot qiita <query> - search from Qiita

    bouzuya> hubot qiita hoge
      hubot> JavaScriptをラブライブ！のロゴに変換するトランスレーター作った http://qiita.com/alucky0707/items/c8265e8138ca1d84fab5

## Configuration

See [`src/scripts/qiita.coffee`](src/scripts/qiita.coffee).

## Development

`npm run`

## License

[MIT](LICENSE)

## Author

[bouzuya][user] &lt;[m@bouzuya.net][mail]&gt; ([http://bouzuya.net][url])

## Badges

[![Build Status][travis-badge]][travis]
[![Dependencies status][david-dm-badge]][david-dm]
[![Coverage Status][coveralls-badge]][coveralls]

[travis]: https://travis-ci.org/bouzuya/hubot-qiita
[travis-badge]: https://travis-ci.org/bouzuya/hubot-qiita.svg?branch=master
[david-dm]: https://david-dm.org/bouzuya/hubot-qiita
[david-dm-badge]: https://david-dm.org/bouzuya/hubot-qiita.png
[coveralls]: https://coveralls.io/r/bouzuya/hubot-qiita
[coveralls-badge]: https://img.shields.io/coveralls/bouzuya/hubot-qiita.svg
[user]: https://github.com/bouzuya
[mail]: mailto:m@bouzuya.net
[url]: http://bouzuya.net
