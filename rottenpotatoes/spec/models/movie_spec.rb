require "rails_helper"

RSpec.describe Movie, :type => :model do
  describe "Testing creation of movies with and without directors" do
      it "Allows creation of movies without director field" do
        #debugger
        FactoryGirl.create(:movie_aladdin)
        expect(Movie.all[0].title).to eq("Aladdin")
      end
      it "creation of movies with director field" do
        FactoryGirl.create(:movie_star_wars)
        FactoryGirl.create(:movie_thx)
        expect(Movie.all.count).to eq(2)
      end
  end
  
  describe "Testing Movie Model Methods" do
    it "should return the list of ratings for class method 'ratings'" do
      expect(Movie.ratings).to eq(['G','PG','PG-13','R','NC-17'])
    end
  
    it "should return nil with different director name" do
      FactoryGirl.create(:movie_star_wars)
      FactoryGirl.create(:movie_thx)
      FactoryGirl.create(:movie_aladdin)
      expect(Movie.with_director('Some Random Name').count).to eq(0)
    end
  end
end