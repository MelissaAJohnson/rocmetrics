# -*- encoding: utf-8 -*-
# stub: rails-controller-testing 0.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "rails-controller-testing"
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Alan Guo Xiang Tan"]
  s.date = "2015-05-28"
  s.email = ["tgx_world@hotmail.com"]
  s.homepage = "https://github.com/tgxworld/rails-controller-testing"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Extracting `assigns` and `assert_template` from ActionDispatch."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 4.2"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 4.2"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 4.2"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
  end
end
