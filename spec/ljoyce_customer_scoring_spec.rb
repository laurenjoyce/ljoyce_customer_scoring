require "spec_helper"

describe LjoyceCustomerScoring do
  it "has a version number" do
    expect(LjoyceCustomerScoring::VERSION).not_to be nil
  end

  # query method returns an Analysis object
  it "returns an instance of the Analysis class" do
    expect(LjoyceCustomerScoring::Analysis.query(income: 50000, zipcode: 60201, age: 35)).to be_a LjoyceCustomerScoring::Analysis
  end

  # query method returns "Invalid query." for invalid query parameters
  it "fails validation with invalid query parameters, expect to return message \'Invalid query.\'" do
    expect(LjoyceCustomerScoring::Analysis.query(income: 50000, zipcode: 60201)).to include("Invalid query.")
  end

  # @propensity is a 5-digit decimal betwee 0 and 1

  # @ranking is included in ["A", "B", "C", "D", "E"]
end
