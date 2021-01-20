class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]
 
  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end
end 