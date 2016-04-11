class Playlist < ActiveRecord::Base
	has_many :playlist_songs, :dependent => :delete_all
  has_many :songs, through: :playlist_songs
end
