# -*- encoding: utf-8 -*-
require File.expand_path('../lib/activerecord-netezza-adapter/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Robb Kidd"]
  gem.email         = ["robb@thekidds.org"]
  gem.summary       = %q{ActiveRecord JDBC adapter for Netezza}
  gem.description   = %q{ActiveRecord adapter for Netezza. Only for user with JRuby.
  Requires a separate Netezza JDBC driver.}
  gem.homepage      = "http://github.com/robbkidd/activerecord-netezza-adapter"

  gem.platform = Gem::Platform.new([nil, 'java', nil])
  gem.files         = %w[
    LICENSE
    README.md
    Rakefile
    activerecord-netezza-adapter.gemspec
    lib/active_record/connection_adapters/netezza_adapter.rb
    lib/activerecord-netezza-adapter.rb
    lib/arjdbc/netezza.rb
    lib/arjdbc/netezza/adapter.rb
    lib/arjdbc/netezza/connection_methods.rb
    lib/arjdbc/discover.rb
  ]
  gem.name          = "activerecord-netezza-adapter"
  gem.require_paths = ["lib"]
  gem.version       = ArJdbc::Netezza::VERSION

  gem.add_dependency(%q<activerecord-jdbc-adapter>, ['>= 1.0.0'])
  
end
