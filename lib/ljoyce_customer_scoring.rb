require "ljoyce_customer_scoring/version"
require "unirest"

module LjoyceCustomerScoring
  class Analysis
    attr_reader :propensity, :ranking

    # Creates an instance of the Analysis class, which assigns values to instance variables @propensity and @ranking based on the input hash
    def initialize(input)
      @propensity = input["propensity"]
      @ranking = input["ranking"]
    end

    def self.request(request_parameters)
      # If request_parameters include age, zipcode, and income
      if request_parameters[:income] && request_parameters[:zipcode] && request_parameters[:age]
        # Using a mock api endpoint
        mock_api = "http://www.mocky.io/v2/58b906ee0f00006706f09b9b"
        data = Unirest.get("#{mock_api}?
          income=#{request_parameters[:income]}&
          zipcode=#{request_parameters[:zipcode]}&
          age=#{request_parameters[:age]}"
        ).body

        # Use this hash to instantiate Analysis – Analysis.initialize(request_result), which returns instance variables @propensity and @ranking request_parameters
        request_result = {
          "propensity" => data[0]["propensity"],
          "ranking" => data[0]["ranking"]
        }

        analysis = Analysis.new(request_result)
        return analysis
      else
        # If request_parameter is invalid
        return "Invalid request."
      end
    end

  end
end
