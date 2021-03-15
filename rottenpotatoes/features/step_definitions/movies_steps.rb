
Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create movie
  end
end

Given /am on the RottenPotatoes home page/ do
  visit movies_path
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body.index(e1) < page.body.index(e2))
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  if uncheck
    rating_list.split(',').each do |rating|
      step %{I uncheck "ratings_#{rating}"}
    end
  else
    rating_list.split(',').each do |rating|
      step %{I check "ratings_#{rating}"}
    end
  end
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  Movie.all.each do |movie|
    step %{I should see "#{movie.title}"}
  end
end

When /go to the edit page for "(.*)"/ do |movie_title|
  visit edit_movie_path(Movie.find_by(title: movie_title))
end

Then /the (\S+) of "(.*)" should be "(.*)"/ do |field_name, movie_name, field_value|
  # Make sure that all the movies in the app are visible in the table
  Movie.find_by(title: movie_name)[field_name].should match(field_value)
end

Given /on the details page for "(.*)"/ do |movie_title|
  visit movie_path(Movie.find_by(title: movie_title))
end

Then /should be on the Similar Movies page for "(.*)"/ do |movie_title|
  # Make sure that all the movies in the app are visible in the table
  visit directors_path({:director => Movie.find_by(title: movie_title).director})
end

Then /should be on the home page/ do
  # Make sure that all the movies in the app are visible in the table
  visit movies_path
end

Then /should see "([^"]*)" has no "([^"]*)" info/ do |movie_title, column_name|
  # Make sure that all the movies in the app are visible in the table
  Movie.find_by(title: movie_title)[column_name].should match('')
end

Then /(.*) seed movies should exist/ do | n_seeds |
  Movie.count.should be n_seeds.to_i
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page
# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

Then /.*I should see the following movies exits.*/ do |movies_table|
  movies_table.hashes.each do |movie|
    expect(page).to have_text(movie['title'])
  end
end

Then /.*following movies not be present.*/ do |movies_table|
  movies_table.hashes.each do |movie|
    expect(page).not_to have_text(movie['title'])
  end
end

Then /I should see all of the movies/ do
  # Make sure that all the movies in the app are visible in the table
  page.all('table#movies tr').count.should == 11
end
