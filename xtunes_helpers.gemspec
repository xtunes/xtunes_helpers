$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "xtunes_helpers/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "xtunes_helpers"
  s.version     = XtunesHelpers::VERSION
  s.authors     = ["xtunes"]
  s.email       = ["com@xtunes.cn"]
  s.homepage    = "http://xtunes.cn"
  s.summary     = "Summary of XtunesHelpers."
  s.description = "Description of XtunesHelpers."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.8"

  s.add_development_dependency "sqlite3"
end
