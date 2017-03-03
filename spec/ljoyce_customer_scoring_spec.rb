require "spec_helper"

describe LjoyceCustomerScoring do
  it "has a version number" do
    expect(LjoyceCustomerScoring::VERSION).not_to be nil
  end

  # query method returns an Analysis object
  it "returns an instance of the Analysis class" do
    expect(LjoyceCustomerScoring::Analysis.query(
      income: 50000, zipcode: 60201, age: 35)).to be_a LjoyceCustomerScoring::Analysis
  end

  # query method returns "Invalid query." for invalid query parameters
  it "fails validation with invalid query parameters, expect to return message \'Invalid query.\'" do
    expect(LjoyceCustomerScoring::Analysis.query(
      income: 50000, zipcode: 60201)).to include("Invalid query.")
  end

  # @propensity is a value between 0 and 1
  it "should return a propensity between 0 and 1" do 
    expect(LjoyceCustomerScoring::Analysis.query(
      income: 50000, zipcode: 60201, age: 35).propensity).to be_between(0, 1)
  end

  # @propensity is a value  with 5-digit decimal
  it "should return a propensity with 5 decimal places" do
    expect(LjoyceCustomerScoring::Analysis.query(
      income: 50000, zipcode: 60201, age: 35).
      propensity.to_s.split('.').last.size).to eq(5)
  end

  # @ranking is included in ["A", "B", "C", "D", "E"]
  it "should return a ranking as a letter A–F" do
    expect(["A", "B", "C", "D", "E", "F"]).to include(
      LjoyceCustomerScoring::Analysis.query(
      income: 50000, zipcode: 60201, age: 35).ranking)
  end
end
