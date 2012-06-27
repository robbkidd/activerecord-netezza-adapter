# arjdbc/discover.rb: Declare ArJdbc.extension modules in this file
# that loads a custom module and adapter.

module ::ArJdbc
  extension :Netezza do |name|
    if name =~ /netezza/i
      require 'arjdbc/netezza'
      true
    end
  end
end
