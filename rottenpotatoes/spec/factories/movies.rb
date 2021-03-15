FactoryGirl.define do
  factory :movie_aladdin, class: Movie do
    title "Aladdin"
    rating "G"
    release_date "25-Nov-1992"
  end
  factory :movie_star_wars, class: Movie do
    title "Star Wars"
    rating "PG"
    release_date "1977-05-25"
    director "George Lucas"
  end
  factory :movie_thx, class: Movie do
    title "THX-1138"
    rating "R"
    release_date "1971-03-11"
    director "George Lucas"
  end
  factory :movie_blade_runner, class: Movie do
    title "Blade Runner"
    rating "PG"
    release_date "1982-06-25"
    director "Ridley Scott"
  end
end