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
      # If request_parameters is meets the following argument requirements
      if request_parameters.class == Hash &&
         request_parameters[:income] &&
         request_parameters[:zipcode] &&
         request_parameters[:age] &&
         request_parameters[:income] > 0 &&
         request_parameters[:zipcode].to_s.length == 5 &&
         request_parameters[:age] > 0
        # Using a mock api endpoint
        mock_api = "http://www.mocky.io/v2/58b906ee0f00006706f09b9b"
        data = Unirest.get(
          "#{mock_api}?
          income=#{request_parameters[:income]}&
          zipcode=#{request_parameters[:zipcode]}&
          age=#{request_parameters[:age]}"
        ).body
        # Use this hash to instantiate Analysis – Analysis.initialize(request_result), which returns instance variables @propensity and @ranking
        request_result = {
          "propensity" => data[0]["propensity"],
          "ranking" => data[0]["ranking"]
        }
        analysis = Analysis.new(request_result)
        return analysis
      else
        # If request_parameter is invalid
        invalid_request_message = "Invalid request: must include valid request parameters for income, zipcode, age."
        return invalid_request_message
      end
    end
  end
end
