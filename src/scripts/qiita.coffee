# Description
#   A Hubot script that search from Qiita
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot qiita <query> - search from Qiita
#
# Author:
#   bouzuya <m@bouzuya.net>
#
module.exports = (robot) ->
  robot.respond /qiita\s+(.+)$/i, (res) ->
    query = res.match[1]
    res
      .http 'https://qiita.com/api/v1/search'
      .query q: query
      .get() (err, _, body) ->
        return res.send(err) if err?
        res.send(JSON.parse(body).map((i) -> "#{i.title} #{i.url}").join('\n'))
