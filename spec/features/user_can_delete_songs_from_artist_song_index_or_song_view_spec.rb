require 'rails_helper'


RSpec.feature "User deletes artist's songs" do
	scenario "they can delete from artist's songs page" do
		artist = create(:artist)
		song2 = Song.create(title: "Red, Red Wine")
		song3 = Song.create(title: "No Woman, No Cry")
		song = create(:song)

		song.artist = artist
		song2.artist = artist
		song3.artist = artist
		song.save
		song2.save
		song3.save

		visit artist_songs_path(artist)
		first(:link, 'Delete').click

		assert_equal artist_songs_path(artist), current_path
		expect(page).to have_no_content "Buffalo Soldier"
		expect(page).to have_content "Red, Red Wine"

	end
end
