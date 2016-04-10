require 'rails_helper'

RSpec.feature "User submits an invalid song" do
  scenario "they fail to create a song with no title" do
    
   artist =  create(:artist)
    visit artist_path(artist)

    click_on "New Song"
    click_on "Create Song"

    expect(page).to have_content "Title cannot be blank"

  end
end
