#  Get the latest jstip from https://github.com/loverajoel/jstips
#
# Notes:
#   Because learning is fun
#
# Commands:
#   hubot jstip - Get jstip

cheerio = require('cheerio');
module.exports = (robot) ->
   robot.respond /jstip/i, (resp) ->
      robot.http("https://github.com/loverajoel/jstips/blob/master/README.md")
	      .get() (err, res, body) ->
	      # pretend there's error checking code here
	        if res.statusCode isnt 200
	          resp.send "Request came back" + res.statusCode
	          return
	        $ = cheerio.load(body);
	        $tipHeader = $('h1:contains(Tips list)').next();
	        tip = '\n'+ $tipHeader.text() + '\n';
	        $tipPointer = $tipHeader.next();
	        while !$tipPointer.is 'h2'
          		tip = tip + $tipPointer.text() + '\n';
          		$tipPointer = $tipPointer.next();
          	resp.send tip