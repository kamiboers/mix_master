require 'rails_helper'

RSpec.feature "User views all playlists" do
  scenario "they see the index of playlists" do
    playlist = Playlist.create(name: "Space Jams")
    Playlist.create(name: "Are Best Jams")


    visit playlists_path

    expect(page).to have_link "Space Jams"
    expect(page).to have_link "Are Best Jams"

    click_link "Space Jams"

    assert_equal playlist_path(playlist.id), current_path

  end
end