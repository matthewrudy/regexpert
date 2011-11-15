# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "regexpert"
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Matthew Rudy Jacobs"]
  s.date = "2011-11-15"
  s.description = "Regular expressions bundled into a single place, so you dont have to think anymore about what email regexp to use."
  s.email = "MatthewRudyJacobs@gmail.com"
  s.extra_rdoc_files = ["README"]
  s.files = ["MIT-LICENSE", "Rakefile", "README", "test/regexpert_test.rb", "test/test_helper.rb", "lib/regexpert.rb"]
  s.homepage = "http://github.com/matthewrudy/regexpert"
  s.rdoc_options = ["--main", "README"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "A bunch of useful Regular expressions"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
