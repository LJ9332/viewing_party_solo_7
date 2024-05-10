require 'rails_helper' # rubocop:disable Style/FrozenStringLiteralComment

RSpec.describe 'Discover Movies', type: :feature do
  describe 'Search by Title' do
    it "Has a button to Discover Top Rated Movies", :vcr do # rubocop:disable Style/StringLiterals
      visit user_discover_path

      expect(page).to have_button('Top Rated Movies')
      click_on 'Top Rated Movies'
      expect(current_path).to eq(user_movies_path)
    end

    it "has a search for movies" do
      visit user_discover_path

      expect(page).to have_button('Search Movie')

      expect(page).to have_field('Search')
      fill_in :search, with: "Hi"
      click_on 'Search Movie'
      expect(current_path).to eq(user_movies_path)
    end
  end
end # rubocop:disable Layout/TrailingEmptyLines