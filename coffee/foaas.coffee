http = require('http')

# Test the params
check_params = ->
  if not process.argv[2]? or not process.argv[3]?
    usage = """
      Usage 1: foaas message :name [:from]
      Usage 2: foaas :name [:from]

      foaas off :name :from
      foaas you :name :from
      foaas this :from
      foaas that :from
      foaas everything :from
      foaas everyone :from
      foaas donut :name :from
      foaas shakespeare :name :from
      foaas linus :name :from
      foaas king :name :from
      foaas pink :from
      foaas life :from
      foaas chainsaw :name :from
      foaas :thing :from
      foaas thanks :from
      foaas flying :from
      foaas fascinating :from

      Copyright © 2014 Paulo Diovani <paulo@diovani.com>
      This work is free. You can redistribute it and/or modify it under the
      terms of the Do What The Fuck You Want To Public License, Version 2,
      as published by Sam Hocevar. See the COPYING file for more details.
      """
    console.info(usage)
    process.exit(0)

# Get the path url, based on the command line parameters
# @param {Array} params
get_url = (params) ->
  url = ""
  url += "/#{encodeURIComponent(p)}" for p in params
  url


# Do a request do service_host and return the Fuck Off message
# @param {String} service_host where do request
# @return {String}
fuckoff_request = (service_host = "foaas.com") ->
  check_params()

  options =
    host: service_host
    port: 80
    path: get_url(process.argv[2..])
    method: 'GET'

  http.request(options, (res) ->
    res.setEncoding('utf8')
    res.on('data', (data) ->
      console.log data
    )
  )
  .on('error', (e) ->
    console.error e.message
  )
  .end()

# export
module.exports = fuckoff_request
