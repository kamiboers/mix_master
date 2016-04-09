require 'rails_helper'

RSpec.feature "User deletes an existing artist" do
  scenario "they delete the artist from their show page" do
    artist = Artist.create(name: "Spoon", image_path: "https://robohash.org/spoon.png?set=set2")

    visit artist_path(artist.id)

    expect(page).to have_content artist.name
    expect(page).to have_css("img[src=\"#{artist.image_path}\"]")
  
    click_on "Delete"

    assert_equal artists_path, current_path
    expect(page).to have_no_content(artist.name)

  end

end