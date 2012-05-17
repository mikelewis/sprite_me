# These settings are directly passed into em-http-request, so look up the docs there :)
config[:http_connection] = {
  :proxy => {
    :host => "127.0.0.1",
    :port => 3128
  }
}

config[:http_request] = {
  :redirects => 5
}