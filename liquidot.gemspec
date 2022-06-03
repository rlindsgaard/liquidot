Gem::Specification.new do |s|
  s.name      = 'liquidot'
  s.version   = '0.0.1'
  s.platform  = Gem::Platform::RUBY
  s.summary   = 'A simple tool for generating dot files using liquid templating'
  s.description = "Generates graphviz DOT files formatted using liquid"
  s.authors   = ['Ronni Elken Lindsgaard']
  s.email     = ['ronni.lindsgaard@gmail.com']
  s.homepage  = 'http://rubygems.org/gems/liquidot'
  s.license   = 'MIT'
  s.files     = Dir.glob("{lib,bin}/**/*")
  s.require_path = 'lib'
  s.executables = ['liquidot']
end
