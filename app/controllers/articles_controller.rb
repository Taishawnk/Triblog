class ArticlesController < ApplicationController

  def index
   @articles = Article.all 
  end 

  def show 
    @article = Article.find(params[:id])
    end 

#   def new 
#   @article = Article.new
#   end

#   def create
#   @article = Article
#   end

#   def update
#   end

#   def edit
#   end 

#   def destroy
#   Article 
#   end
  
#   private

#   def atricle_params 
 
#   end

 end 