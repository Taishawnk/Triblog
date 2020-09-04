class ArticlesController < ApplicationController

  def index
   @articles = Article.all 
  end 

  def show 
    @article = Article.find(params[:id])
  end 

   def new 
    @article = Article.new
   end

   def create
    @article = Article.new(article_params)
    @article.save
    redirect_to @article
   end

#   def update
#   end

#   def edit
#   end 

#   def destroy
#   Article 
#   end
  
   private

  def article_params 
    params.require(:article).permit(:title, :description)
   end




 end 