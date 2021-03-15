require 'rails_helper'

RSpec.describe MoviesController, type: :controller  do
    describe "Checking the Routes" do
        it "/movies redirects to index method of controller" do
            expect(get: '/movies').to route_to(controller: 'movies', action: 'index')
        end
        
        it "/shows details of a movie" do
            FactoryGirl.create(:movie_aladdin)    
            expect(get: '/movies/1').to route_to(controller: 'movies', action: 'show', :id => "1")
        end
        it "/response code of 200 for edit" do
            FactoryGirl.create(:movie_aladdin) 
            get :edit, {:id => 1}
            expect(response.code).to eq("200")
        end
        it "/response code of 200 for show" do
            FactoryGirl.create(:movie_aladdin) 
            get :show, {:id => 1}
            expect(response.code).to eq("200")
        end
        
        
    end
    describe "Looking up movies with same directors" do
        it "/redirects to home page if director field is empty" do
            get :directors, {:director => nil}
            expect(response).to redirect_to(movies_path)
        end
        it "/response code of 200 if a non-empty director field present" do
            get :directors, {:director => "George Lucas"}
            expect(response.code).to eq("200")
        end
    end
end