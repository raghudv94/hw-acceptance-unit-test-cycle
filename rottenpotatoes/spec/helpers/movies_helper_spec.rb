require "rails_helper"

describe MoviesHelper do
    describe "Check Number is odd" do
        it "returns true" do
            helper.oddness(1).should eq('odd')
        end
    end
end