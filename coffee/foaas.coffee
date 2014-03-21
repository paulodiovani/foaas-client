http = require('http')

###
# Test the params
###
check_params = ->
  if not process.argv[2]? or not process.argv[3]?
    usage = "Usage 1: foaas message argument 1 [argument 2] \n" +
      "Usage 2: foaas argument 1 argument 2 \n\n" +
      "foaas off :name :from \n" +
      "foaas you :name :from \n" +
      "foaas this :from \n" +
      "foaas that :from \n" +
      "foaas everything :from \n" +
      "foaas everyone :from \n" +
      "foaas donut :name :from \n" +
      "foaas shakespeare :name :from \n" +
      "foaas linus :name :from \n" +
      "foaas king :name :from \n" +
      "foaas pink :from \n" +
      "foaas life :from \n" +
      "foaas chainsaw :name :from \n" +
      "foaas :thing :from \n" +
      "foaas thanks :from \n" +
      "foaas flying :from \n" +
      "foaas fascinating :from \n"
    console.info(usage)
    process.exit(0)

###
# Get the path url, based on the command line parameters
# @param {Array} params lista de parâmetros passados para o script
###
get_url = (params) ->
  url = ""
  url += "/#{encodeURIComponent(p)}" for p in params
  url


###
# Do a request do service_host and return the Fuck Off message
# @param {String} service_host where do request
# @return {String}
###
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