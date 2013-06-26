const crypto = require('crypto'),
      fs = require("fs"),
      http = require("http");

var webservice = require('./webservice.js/lib/webservice'),
    demoModule = require('./OSDIPP.js');

webservice.createServer(demoModule).listen(8080);
console.log(' > json webservice started on port 8080');