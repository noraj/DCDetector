# frozen_string_literal: true

require_relative 'lib/dcdetector/version'

Gem::Specification.new do |s|
  s.name          = 'dcdetector'
  s.version       = DCDetector::VERSION
  s.platform      = Gem::Platform::RUBY
  s.summary       = ''
  s.description   = ''
  s.authors       = ['Alexandre ZANNI']
  s.email         = 'alexandre.zanni@europe.com'
  s.homepage      = 'https://noraj.github.io/dcdetector/'
  s.license       = 'MIT'

  s.files         = Dir['bin/*'] + Dir['lib/**/*.rb'] + ['LICENSE']
  s.bindir        = 'bin'
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.metadata = {
    'yard.run'              => 'yard',
    'bug_tracker_uri'       => 'https://github.com/noraj/DCDetector/issues',
    'changelog_uri'         => 'https://noraj.github.io/DCDetector/TODO',
    'documentation_uri'     => 'https://noraj.github.io/DCDetector/TODO',
    'homepage_uri'          => 'https://noraj.github.io/DCDetector/TODO',
    'source_code_uri'       => 'https://github.com/noraj/DCDetector/',
    'rubygems_mfa_required' => 'true'
  }

  s.required_ruby_version = ['>= 3.0.0', '< 4.0']

  s.add_runtime_dependency('docopt', '~> 0.6') # for argument parsing
  s.add_runtime_dependency('paint', '~> 2.3') # for colorized output
end
