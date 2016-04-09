require 'rails_helper'

RSpec.feature "User submits a new song" do
  scenario "they create a song associated with an artist" do
    artist = Artist.create(name: "Andrew Bird", image_path: "https://robohash.org/andrewbird.png?set=set2")
    
    visit artist_path(artist)
    click_on "New Song"

    song_title = "Hole in the Ocean Floor"

    fill_in "song_title", with: song_title
    click_on "Create Song"

    expect(page).to have_content song_title
    expect(page).to have_link artist.name, href: artist_path(artist)

  end
end
