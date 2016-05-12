class BlogsController < ApplicationController
  before_action :authenticate_admin!,except: [:index,:show]
  before_action :find_params, only: [:edit,:destroy,:update,:show]
  def index
  	@article = Article.all.order("created_at DESC")
  end

  def new
  	@article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
    	redirect_to blogs_path
    else
    	render 'new'
    end
  end

  

  def show
  	  	
  end

  def edit
 
  end

  def update
    @article.update_attributes(article_params)
    redirect_to blogs_path 
  end

  def destroy  
   @article.destroy
   redirect_to blogs_path
  end

    private 
    def article_params
    	params.require(:article).permit(:title,:body,:author)
    end

    def find_params
      @article = Article.find(params[:id]) 
    end
end
