require "ljoyce_customer_scoring/version"
require "unirest"

module LjoyceCustomerScoring
  class Analysis
    def self.new(input)
      {
        "propensity": rand.round(5),
        "ranking": ["A", "B", "C", "D", "E", "F"].sample
      }
    end

  end
end
