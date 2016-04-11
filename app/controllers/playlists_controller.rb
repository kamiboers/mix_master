class PlaylistsController < ApplicationController

def index
	@playlists = Playlist.all
end

def new
	@playlist = Playlist.new
end

def create
	@playlist = Playlist.new(playlist_params)	
		if @playlist.save
			redirect_to playlist_path(@playlist)
		else
			flash.notice = "Playlist name cannot be blank"
			render :new
		end
end

  def show
    @playlist = Playlist.find(params[:id])
  end

  def edit
  	@playlist = Playlist.find(params[:id])
  end

  def update
	@playlist = Playlist.find(params[:id])
	@playlist.update(playlist_params)

	redirect_to playlist_path(@playlist)
end

def destroy
		@playlist = Playlist.find(params[:id])
		@playlist.destroy

		redirect_to playlists_path
	end

private

def playlist_params
	params.require(:playlist).permit(:name, song_ids: [])
end

end
