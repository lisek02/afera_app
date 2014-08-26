# -*- encoding: utf-8 -*-
# stub: gravatar-ultimate 2.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "gravatar-ultimate"
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Colin MacKenzie IV"]
  s.date = "2010-08-30"
  s.description = "The Ultimate Gravatar Gem!\n\nThis gem is used to interface with the entire Gravatar API: it's not just for generating image URLs, but for connecting\nto and communicating with the XML-RPC API too! Additionally, it can be used to download the Gravatar image data itself,\nrather than just a URL to that data. This saves you the extra step of having to do so."
  s.email = "sinisterchipmunk@gmail.com"
  s.extra_rdoc_files = ["LICENSE", "README.rdoc"]
  s.files = ["LICENSE", "README.rdoc"]
  s.homepage = "http://www.thoughtsincomputation.com/"
  s.rdoc_options = ["--charset=UTF-8"]
  s.rubygems_version = "2.2.2"
  s.summary = "A gem for interfacing with the entire Gravatar API: not just images, but the XML-RPC API too!"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 2.3.14"])
      s.add_runtime_dependency(%q<rack>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 1.3.0"])
      s.add_development_dependency(%q<fakeweb>, [">= 1.2.8"])
      s.add_development_dependency(%q<i18n>, ["~> 0.6.0"])
      s.add_development_dependency(%q<rake>, ["~> 0.9.2.2"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.11"])
      s.add_development_dependency(%q<coveralls>, [">= 0"])
    else
      s.add_dependency(%q<activesupport>, [">= 2.3.14"])
      s.add_dependency(%q<rack>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 1.3.0"])
      s.add_dependency(%q<fakeweb>, [">= 1.2.8"])
      s.add_dependency(%q<i18n>, ["~> 0.6.0"])
      s.add_dependency(%q<rake>, ["~> 0.9.2.2"])
      s.add_dependency(%q<rdoc>, ["~> 3.11"])
      s.add_dependency(%q<coveralls>, [">= 0"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 2.3.14"])
    s.add_dependency(%q<rack>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 1.3.0"])
    s.add_dependency(%q<fakeweb>, [">= 1.2.8"])
    s.add_dependency(%q<i18n>, ["~> 0.6.0"])
    s.add_dependency(%q<rake>, ["~> 0.9.2.2"])
    s.add_dependency(%q<rdoc>, ["~> 3.11"])
    s.add_dependency(%q<coveralls>, [">= 0"])
  end
end
