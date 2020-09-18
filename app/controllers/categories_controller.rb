class CategoriesController < ApplicationController

    before_action :require_admin, except: [:index, :show]

    def new
        @category = Category.new
    end
    
    def create
        @category = Category.new(cat_params )
        if @category.save 
            flash[:notice] = "This category was successfully created"
            redirect_to @category
        else
            render 'new'
        end
    end

    def show
        @category = Category.find(params[:id])
        @articles = @category.articles.paginate(page: params[:page], per_page: 5)
    end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
         if @category.update(cat_params)
         flash[:notice] = "Category name updated successfully"
         redirect_to @category
         else
            flash[:alert] = "That action is not valid name must be longer then 3 but less then 17 char"
         render 'edit'
        end
    end
        def index

            @categories = Category.paginate(page: params[:page], per_page: 5)
        end

    private

    def cat_params
        params.require(:category).permit(:name)
    end 

    def require_admin
        if !(logged_in? && current_user.admin?)
        flash[:alert] = "Only admins can preform this task"
        redirect_to categories_path
        end
    end
end

