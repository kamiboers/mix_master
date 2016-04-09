require 'rails_helper'

RSpec.feature "User views all artists" do
  scenario "they see the index of artists" do
    artist = Artist.create(name: "Sigur Ros", image_path: "https://robohash.org/sigurros.png?set=set2")

    visit artists_path

    expect(page).to have_content artist.name

    click_link "#{artist.name}"

    expect(page).to have_css("img[src=\"#{artist.image_path}\"]")
    assert_equal artist_path(artist.id), current_path

  end

  

end