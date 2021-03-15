class Movie < ActiveRecord::Base
    def self.ratings
        ['G','PG','PG-13','R','NC-17']
    end
    
    def self.with_director(director)
        Movie.where(director: director)
    end
end
