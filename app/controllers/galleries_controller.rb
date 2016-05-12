class GalleriesController < ApplicationController
 before_action :authenticate_admin!,except: [:index,:show]
  before_action :find_params, only: [:edit,:destroy,:update,:show]
	def index
		@gallery = Gallery.all.order("created_at DESC")
	end

	def new
		@gallery = Gallery.new
	end
    
    def create
    	@gallery = Gallery.new(gallery_params)
    	if @gallery.save
    	redirect_to galleries_path
       else
    	render 'new'
       end
   end


  def show
  	  	
  end

  def edit
 
  end

  def update
    @gallery.update_attributes(gallery_params)
    redirect_to gallery_path 
  end

  def destroy  
   @gallery.destroy
   redirect_to galleries_path
  end

    private 
    def gallery_params
    	params.require(:gallery).permit(:title,:description,:image)
    end

    def find_params
      @gallery = Gallery.find(params[:id]) 
    end
end
