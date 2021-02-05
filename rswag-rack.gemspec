# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'rswag-rack'
  s.version     = ENV['TRAVIS_TAG'] || '0.0.1'
  s.authors     = ['Ark', 'Richie Morris', 'Greg Myers', 'Jay Danielian']
  s.email       = ['domaindrivendev@gmail.com']
  s.homepage    = 'https://github.com/arkdy/rswag-rack'
  s.summary     = 'Rswag without Rails dependencies. An OpenAPI-based (formerly called Swagger) DSL for rspec-rails & accompanying rake task for generating OpenAPI specification files'
  s.description = 'Simplify API integration testing with a succinct rspec DSL and generate OpenAPI specification files directly from your rspecs. More about the OpenAPI initiative here: http://spec.openapis.org/'
  s.license     = 'MIT'

  # s.files = Dir['{lib}/**/*'] + ['MIT-LICENSE', 'Rakefile']
  s.files = Dir.glob("lib/**/*")
  s.require_path = "lib"
  s.add_dependency 'activesupport', '>= 3.1', '< 7.0'
  s.add_dependency 'json-schema', '~> 2.2'
end
