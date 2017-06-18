Gem::Specification.new do |s|
  s.name        = 'tumblrer'
  s.version     = '0.0.1'
  s.date        = '2017-07-18'
  s.summary     = 'tumblrer'
  s.description = 'tumblrer gem allows you to download images from tumblr blogs'
  s.authors     = ['Burak KIYAK']
  s.email       = 'brkkyk@gmail.com'
  s.files       = ['lib/tumblrer.rb']
  s.homepage    = 'http://rubygems.org/gems/tumblrer'
  s.license     = 'MIT'
  s.executables << 'tumblrer'
  s.add_runtime_dependency 'nokogiri', '~> 1.8', '>= 1.8.0'
  s.add_runtime_dependency 'mechanize', '~> 2.7', '>= 2.7.5'
  s.add_development_dependency 'nokogiri', '~> 1.8', '>= 1.8.0'
  s.add_development_dependency 'mechanize', '~> 2.7', '>= 2.7.5'
end
