class CategoriesController < ApplicationController
    def index
        user = User.find(current_user.id);
        # byebug
        render json: user.categories, :include => :videos
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

    # def user_categories 
    #     user = User.find_by(uid: params[:uid])
        
    #     render json: user.categories
    # end 

    def destroy
        user = User.find(current_user.id)
        category = Category.find_by(id: params[:category_id], user_id: user.id)
        # byebug
        category.destroy!
        render json: { category: category, message: 'record deleted' }, status: :ok
    end 

    private

    def category_params
        params.permit(:name, :google_token, :uid, :category_id)
    end 
end
