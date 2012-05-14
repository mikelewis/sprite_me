# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sprite_me/version"

Gem::Specification.new do |s|
  s.name        = "sprite_me"
  s.version     = SpriteMe::VERSION
  s.authors     = ["Mike Lewis"]
  s.email       = ["ft.mikelewis@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "sprite_me"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  #run time
  ['em-http-request', 'em-synchrony', 'yajl-ruby'].each do |runtime|
    s.add_runtime_dependency runtime
  end

  #development_deps
  [].each do |development|
    s.add_development_dependency development
  end
end
