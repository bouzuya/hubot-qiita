module.exports = function(robot) {
  return robot.respond(/qiita\s+(.+)$/i, function(res) {
    var query;
    query = res.match[1];
    return res.http('https://qiita.com/api/v1/search').query({
      q: query
    }).get()(function(err, _, body) {
      if (err != null) {
        return res.send(err);
      }
      return res.send(JSON.parse(body).map(function(i) {
        return "" + i.title + " " + i.url;
      }).join('\n'));
    });
  });
};
