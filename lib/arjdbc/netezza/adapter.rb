module ::ArJdbc
  module Netezza
    def self.column_selector
      [ /netezza/i, lambda {  | cfg, col | col.extend( ::ArJdbc::Netezza::Column ) } ]
    end

    module Column
    end

    def modify_types(tp)
      tp[:text]   = nil
      tp[:binary] = nil
    end
  end
end
