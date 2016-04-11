require 'rails_helper'


RSpec.feature "User views artist's songs" do
	scenario "they see artist's songs listed alphabetically on " do
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

		visit artist_path(artist)
		click_on "Songs by #{artist.name}"

		expect(page).to have_content song.title
		expect(page).to have_content song2.title
		expect(page).to have_content song3.title
		page.first('div').text.should include('A Title')

		click_on "A Title"

		assert_equal song_path(song), current_path
	end
end
