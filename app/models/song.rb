class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :playlist_songs, :dependent => :delete_all

  validates :title, presence: true
end
