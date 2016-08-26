# Description:
#   Get a stock price
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   stock <ticker> [1d|5d|2w|1mon|1y] - Get a stock price
#
# Author:
# Symphony Integration by Vinay Mistry
Entities = require('html-entities').XmlEntities
entities = new Entities()

module.exports = (robot) ->
  robot.hear /stock (?:info|price|quote)?\s?(?:for|me)?\s?@?([A-Za-z0-9.-_]+)\s?(\d+\w+)?/i, (msg) ->
    ticker = escape(msg.match[1])
    time = msg.match[2] || '5d'
    msg.http('http://finance.google.com/finance/info?client=ig&q=' + ticker)
      .get() (err, res, body) ->
        if err
           msg.send "Failed to look up #{ticker}"
        else
          try
            result = JSON.parse(body.replace(/\/\/ /, ''))
            url = "http://chart.finance.yahoo.com/z?s=#{ticker}&t=#{time}&q=l&l=on&z=l&a=v&p=s&lang=en-US&region=US#.png"
            msg.send {
              format: 'MESSAGEML'
              text: "<messageML><cash tag=\"#{ticker.toUpperCase()}\"/> <b>@ $#{entities.encode(result[0].l_cur)} #{result[0].c} #{result[0].ltt}</b><br/><a href=\"#{entities.encode(url)}\"/></messageML>"
            }
