require "ljoyce_customer_scoring/version"
require "unirest"

module LjoyceCustomerScoring
  class Analysis

    def initialize(input)
      @propensity = input["propensity"]
      @ranking = input["ranking"]
    end

    def self.query(input_parameters)
      # if params include age, zipcode, and income
      if input_parameters[:income] && input_parameters[:zipcode] && input_parameters[:age]
        # mock api endpoint
        data = Unirest.get("https://jsonplaceholder.typicode.com/users?
          income=#{input_parameters[:income]}&
          zipcode=#{input_parameters[:zipcode]}&
          age=#{input_parameters[:age]}"
        ).body

        # use this hash to instantiate Analysis – Analysis.initialize(query_result), which returns random propensity and ranking data
        query_result = {
          "propensity" => rand.round(5),
          "ranking" => ["A", "B", "C", "D", "E", "F"].sample
        }

        analysis = Analysis.new(query_result)
        return analysis
      else
        # if params are missing an attribute
        return "Invalid query."
      end
    end

  end
end
