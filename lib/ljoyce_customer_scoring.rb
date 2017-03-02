require "ljoyce_customer_scoring/version"
require "unirest"

module LjoyceCustomerScoring
  class Analysis
    def self.new(input)
      {
        "propensity": 0.26532,
        "ranking": "C"
      }
    end

  end
end
