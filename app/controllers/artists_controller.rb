class ArtistsController < ApplicationController
before_action :set_artist, only: [:show, :edit, :update, :destroy]

	def index
		@artists = Artist.all
	end

	def new
		@artist = Artist.new
	end

	def create
		@artist = Artist.new(artist_params)
		if @artist.save
			flash.notice = "The artist #{@artist.name} was saved!"
			redirect_to artist_path(@artist)
		else
			flash.notice = "All artists must have a name and an image path."
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @artist.update(artist_params)

		redirect_to artist_path(@artist)
	else
		render :edit
	end
	end

	def destroy
		@artist.destroy

		redirect_to artists_path
	end

	private

	def set_artist
		@artist= Artist.find(params[:id])
	end

	def artist_params
		params.require(:artist).permit(:name, :image_path)  
	end

end