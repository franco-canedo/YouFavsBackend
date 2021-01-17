class CategoriesController < ApplicationController
    def index
        # byebug
        user = User.find_by(uid: params[:uid])
        
        render json: user.categories
    end 

    def create 
        # byebug
        user = User.find_by(google_token: params[:google_token])
        category = Category.new(name: params[:name], user_id: user.id)
        if category.save
            render json: category
        else 
            render json: { error: 'failed to save category'}, status: :failed
        end
    end

    def user_categories 
        user = User.find_by(uid: params[:uid])
        
        render json: user.categories
    end 

    def delete
    end 

    private

    def category_params
        params.permit(:name, :google_token, :uid)
    end 
end
