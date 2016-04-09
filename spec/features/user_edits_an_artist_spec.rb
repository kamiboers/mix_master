require 'rails_helper'

RSpec.feature "User can edit existing artist" do
  scenario "they edit the artist from their show page" do
    artist = Artist.create(name: "Spoon", image_path: "https://robohash.org/spoon.png?set=set2")

    visit artist_path(artist.id)

    expect(page).to have_content artist.name
    expect(page).to have_css("img[src=\"#{artist.image_path}\"]")
  
    click_on "Update Artist"

    new_name = "Falafel"

    fill_in "artist_name", with: new_name
    click_on "Update Artist"

    assert_equal current_path, artist_path(artist)
    expect(page).to have_no_content "Spoon"
    expect(page).to have_content "Falafel"

  end

end