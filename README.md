# Activerecord::Netezza::Adapter

ActiveRecord JDBC adapter for Netezza backends.

The organization of the adapter was cribbed wholesale from
[Nick Sieger's CacheDB adapter][cachedb.git].
Any errors are my own.

[cachedb.git]: https://github.com/nicksieger/activerecord-cachedb-adapter

## The Ugly Hack

Netezza does not have a data type to map to `:text` and `:binary`. You can
use [activerecord-jdbc-adapter][arjdbc.git] to connect if you remove those
data types from the type converter lookup hash `AR_TO_JDBC_TYPES`. Here's
the monkey patch to do so:

[arjdbc.git]: https://github.com/jruby/activerecord-jdbc-adapter

```ruby
# Not really recommended

require 'arjdbc/jdbc/type_converter'

module ActiveRecord
  module ConnectionAdapters
    class JdbcTypeConverter
      AR_TO_JDBC_TYPES.delete(:text)
      AR_TO_JDBC_TYPES.delete(:binary)
    end
  end
end
```

One of the disadvantages of this monkeypatch is that within a codebase
using ARJDBC and the patch, no other JDBC driver will have the `:text`
and `:binary` data types. This gem is intended to confine the removal
of types to only database connections using this adapter.

## Installation

Add these lines to your application's Gemfile:

```ruby
    gem 'activerecord-netezza-adapter', 
        :git => 'https://github.com/robbkidd/activerecord-netezza-adapter'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord-netezza-adapter

Place the Netezza JDBC driver--not distributed with this gem--in 
your JRuby classpath. 

For example, place nzjdbc3.jar in vendor/lib/java. If using Warbler 
to deploy your app as a WAR, include the following in config/warble.rb

```ruby
config.java_libs += FileList["vendor/lib/java/*.jar"]
```

## Usage

Define your database connection information as expected:

```yaml
development:
  adapter: netezza
  host: nzhostname
  database: dbname
  user: username
  password: $up3r$3cr3t!
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
