require "spec_helper"

describe LjoyceCustomerScoring do
  it "has a version number" do
    expect(LjoyceCustomerScoring::VERSION).not_to be nil
  end

  it "returns a JSON response" do
    expect(LjoyceCustomerScoring::Analysis.new("test")).to eq({
      "propensity": 0.26532, "ranking": "C"})
  end
end
