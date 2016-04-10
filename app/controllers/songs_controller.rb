class SongsController < ApplicationController

def index
@artist = Artist.find(params[:artist_id])
@songs = @artist.songs.order(:title)
end

def new
	@artist = Artist.find(params[:artist_id])
	@song = @artist.songs.new
end

def create
	@artist = Artist.find(params[:artist_id])
	@song = @artist.songs.new(song_params)
	if @song.save
		flash.notice = "The song #{@song.title} was saved!"
		redirect_to song_path(@song)
	else
		flash.notice = "Title cannot be blank"
		render :new
	end
end

def show
	@song = Song.find(params[:id])
end

def edit
	@song = Song.find(params[:id])
end

def update
	@song = Song.find(params[:id])
	@song.update(song_params)

	redirect_to song_path(@song)
end

def destroy
		@song = Song.find(params[:id])
		artist = @song.artist
		@song.destroy

		redirect_to artist_songs_path(artist)
	end

private 

def song_params
	params.require(:song).permit(:title)
end

end