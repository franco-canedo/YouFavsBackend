class UsersController < ApplicationController
    def index
        users = User.all
        render json: users
    end 

    def create
        user = User.new(user_params)
        if user.save
            render json: user, status: :ok
        else 
            render json: {
                error: "User not created."
            }, status: :not_created
        end
    end 

    def delete
        user = User.find_by(name: params[:name])
        user.delete
        render json: user
    end

    private

    def user_params
        params.permit(:id, :name)
    end 
end
