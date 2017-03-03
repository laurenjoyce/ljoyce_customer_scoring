require "spec_helper"

describe LjoyceCustomerScoring do
  it "has a version number" do
    expect(
      LjoyceCustomerScoring::VERSION
    ).not_to be nil
  end

  # Query method returns an Analysis object
  it "returns an instance of the Analysis class" do
    expect(
      LjoyceCustomerScoring::Analysis.request(
        income: 50000,
        zipcode: 60201,
        age: 35
      )
    ).to be_a LjoyceCustomerScoring::Analysis
  end

  # Query method returns "Invalid query." for invalid query parameters
  # NOTE: This test fails when using the mock API, as the mock API won't take in an argument for parameters. Test will pass with an API enpoint that accepts parameters
  it "fails validation with invalid request parameters, expect to return \'ivalid request\' message" do
    expect(
      LjoyceCustomerScoring::Analysis.request(
        income: 50000,
        zipcode: 60201
      )
    ).to include(invalid_request_message)
  end

  # @propensity is a value between 0 and 1
  it "should return a propensity between 0 and 1" do
    expect(
      LjoyceCustomerScoring::Analysis.request(
        income: 50000,
        zipcode: 60201,
        age: 35
      ).propensity
    ).to be_between(0, 1)
  end

  # @propensity is a value with 5-digit decimal
  it "should return a propensity with 5 decimal places" do
    expect(
      LjoyceCustomerScoring::Analysis.request(
        income: 50000,
        zipcode: 60201,
        age: 35
      ).propensity.to_s.split('.').last.size
    ).to eq(5)
  end

  # @ranking is included in ["A", "B", "C", "D", "E"]
  it "should return a ranking as a letter A–F" do
    expect(
      ["A", "B", "C", "D", "E", "F"]).to include(
        LjoyceCustomerScoring::Analysis.request(
          income: 50000,
          zipcode: 60201,
          age: 35
        ).ranking)
  end
end
