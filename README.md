# Activerecord::Netezza::Adapter

ActiveRecord JDBC adapter for Netezza backends. The organization of this
adapter was cribbed wholesale from 
[Nick Sieger's CacheDB adapter](https://github.com/nicksieger/activerecord-cachedb-adapter).
Any errors are my own.

## Installation

Add these lines to your application's Gemfile:

    gem 'activerecord-netezza-adapter', 
        :git => 'https://github.com/robbkidd/activerecord-netezza-adapter'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord-netezza-adapter

Place the Netezza JDBC driver--not distributed with this gem--in 
your JRuby classpath. 

For example, place nzjdbc3.jar in vendor/lib/java. If using Warbler 
to deploy your app as a WAR, include the following in config/warble.rb

    config.java_libs += FileList["vendor/lib/java/*.jar"]

## Usage

Define your database connection information as expected:

    development:
      adapter: netezza
      host: nzhostname
      database: dbname
      user: username
      password: $up3r$3cr3t!


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
