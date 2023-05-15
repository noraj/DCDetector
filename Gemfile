# frozen_string_literal: true

source 'https://rubygems.org'

# Specify your gem's dependencies in .gemspec
gemspec

# Needed for the CLI only
group :runtime, :cli do
  gem 'docopt', '~> 0.6' # for argument parsing
  gem 'paint', '~> 2.3' # for colorized ouput
end

# Needed to install dependencies
group :development, :install do
  gem 'bundler', '~> 2.4'
end

# Needed for linting
group :development, :lint do
  gem 'rubocop', '~> 1.51'
end

group :development, :docs do
  gem 'commonmarker', '~> 0.23' # for markdown support in YARD
  gem 'yard', ['>= 0.9.27', '< 0.10']
  gem 'yard-coderay', '~> 0.1' # for syntax highlight support in YARD
end
