class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new #going to update the view with this new method
    @picture = Picture.new
  end

  def create
#makes a new picture with what picture_params returns
#this is the method we're calling (post pictures => pictures#create)
    @picture = Picture.new(picture_params) #picture info that came in the request
    if @picture.save #if the picture was successfully saved redirect
      redirect_to pictures_url
    else
      render :new #Render the view associated with the action :new (new.html.erb)
    end
    #render :text => "Saving a picture. URL: #{params[:url]}, Title: #{params[:title]}, Artist: #{params[:artist]}"
  end


  private
  def picture_params
    params.require(:picture).permit(:artist, :title, :url)
  end


end
