Gem::Specification.new do |s|
  s.name          = 'leaseweb-cdn-rest-api'
  s.version       = '1.0.2'
  s.authors       = 'Arnoud Vermeer'
  s.email         = 'arnoud@tumblr.com'
  s.license       = 'Apache'
  s.summary       = 'Leaseweb CDN API client for Ruby'
  s.description   = 'Leaseweb CDN REST API client for Ruby.'
  s.homepage      = 'https://github.com/funzoneq/leaseweb-cdn-rest-api'

  s.files         = `git ls-files`.split("\n")

  s.add_dependency 'httparty'
end
