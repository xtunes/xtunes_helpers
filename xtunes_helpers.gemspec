$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "xtunes_helpers/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "xtunes_helpers"
  s.version     = XtunesHelpers::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of XtunesHelpers."
  s.description = "TODO: Description of XtunesHelpers."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.9"
  s.add_dependency 'test_engine'

  s.add_development_dependency "sqlite3"
end
