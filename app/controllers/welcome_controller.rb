class WelcomeController < ApplicationController
	before_action :authenticate_admin!,except: [:index,:show]
  def index
  	  	@article = Article.limit(4).all.order("created_at DESC")
  end
end
