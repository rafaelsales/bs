require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.default_cassette_options = { record: :new_episodes,
    match_requests_on: [
      :method,
      VCR.request_matchers.uri_without_param('AWSAccessKeyId', 'Timestamp', 'Signature')
    ]
  }
end

if ENV['REAL_REQUESTS']
  VCR.turn_off!(ignore_cassettes: true)
  WebMock.allow_net_connect!
end
