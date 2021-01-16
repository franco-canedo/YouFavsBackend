class CategoriesController < ApplicationController
    def index
        user = User.find_by(uid: session[:current_user_id])
        byebug
        render json: user.categories
    end 

    def create 
        # byebug
        user = User.find_by(uid: session[:current_user_id])
        
        category = Category.new(name: params[:name], user_id: user.id)
        if category.save
            render json: category
        else 
            render json: { error: 'failed to save category'}, status: :failed
        end
    end

    def delete
    end 

    private

    def category_params
        params.permit(:name)
    end 
end
