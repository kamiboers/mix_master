require 'rails_helper'

RSpec.feature "User edits a song title" do
  scenario "they update a song's title from show page" do
    artist = create(:artist)
    song = create(:song)
    song.artist = artist
    song.save

   visit song_path(song.id)
   click_on "Edit"

   new_title = "Red, Red Wine"
   fill_in "song_title", with: new_title
   click_on "Submit Song"

    expect(page).to have_content new_title
    expect(page).to have_link "#{artist.name}"

  end
end
