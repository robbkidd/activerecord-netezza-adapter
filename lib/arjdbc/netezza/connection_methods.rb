class ActiveRecord::Base
  class << self
    def netezza_connection( config )
      config[:port] ||= 5480
      config[:url] ||= "jdbc:netezza://#{config[:host]}:#{config[:port]}/#{config[:database]}"
      config[:driver] ||= "org.netezza.Driver"
      jdbc_connection(config)
    end
  end
end
