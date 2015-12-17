$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)

require 'file_writer/version'

Gem::Specification.new do |s|
  s.name          = 'file_writer'
  s.version       = FileWriter::VERSION
  s.description   = 'Write to a tempfile on long jobs and replace the original once completed'
  s.summary       = 'Encapsulation for long running jobs that write to a file'
  s.authors       = ['Tomasz Skorupa']
  s.files         = Dir['lib/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 2.1.5'
end
