// Generated by CoffeeScript 1.7.1
(function() {
  var check_params, fuckoff_request, get_url, http;

  http = require('http');

  check_params = function() {
    var usage;
    if ((process.argv[2] == null) || (process.argv[3] == null)) {
      usage = "Usage 1: foaas message :name [:from]\nUsage 2: foaas :name [:from]\n\nfoaas off :name :from\nfoaas you :name :from\nfoaas this :from\nfoaas that :from\nfoaas everything :from\nfoaas everyone :from\nfoaas donut :name :from\nfoaas shakespeare :name :from\nfoaas linus :name :from\nfoaas king :name :from\nfoaas pink :from\nfoaas life :from\nfoaas chainsaw :name :from\nfoaas :thing :from\nfoaas thanks :from\nfoaas flying :from\nfoaas fascinating :from\n\nCopyright © 2014 Paulo Diovani <paulo@diovani.com>\nThis work is free. You can redistribute it and/or modify it under the\nterms of the Do What The Fuck You Want To Public License, Version 2,\nas published by Sam Hocevar. See the COPYING file for more details.";
      console.info(usage);
      return process.exit(0);
    }
  };

  get_url = function(params) {
    var p, url, _i, _len;
    url = "";
    for (_i = 0, _len = params.length; _i < _len; _i++) {
      p = params[_i];
      url += "/" + (encodeURIComponent(p));
    }
    return url;
  };

  fuckoff_request = function(service_host) {
    var options;
    if (service_host == null) {
      service_host = "foaas.com";
    }
    check_params();
    options = {
      host: service_host,
      port: 80,
      path: get_url(process.argv.slice(2)),
      method: 'GET',
      headers: {
        'Accept': 'text/plain'
      }
    };
    return http.request(options, function(res) {
      res.setEncoding('utf8');
      return res.on('data', function(data) {
        return console.log(data);
      });
    }).on('error', function(e) {
      return console.error(e.message);
    }).end();
  };

  module.exports = fuckoff_request;

}).call(this);
