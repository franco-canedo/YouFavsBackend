class SessionsController < ApplicationController
    # skip_before_action :require_user


    # skip_before_action :authorized, only: [:create_session]
    def profile 
        render json: current_user, :include => {:categories => {:only => :name}}, status: :accepted
    end 


  def create_session
    # Get access tokens from the google server
    profile_object = params[:profileObj]
    access_token = params[:access_token]
    # byebug
    user = User.create_from_omniauth(profile_object)

    # Access_token is used to authenticate request made from the rails application to the google server
    user.google_token = access_token['access_token']
    # Refresh_token to request new access_token
    # Note: Refresh_token is only sent once during the first request
    refresh_token = access_token['id_token']
    user.google_refresh_token = refresh_token if refresh_token.present?
    user.save!

    token = encode_token({user_id: user.id})

    #create cookie after user is made
    session[:current_user_id] = user.uid   
    # byebug
    if user.valid? 
        render json: {user: user, jwt: token}, status: :created
    else
        render json: {error: 'failed to log in'}, status: :not_acceptable
    end
  end

  def destroy
    cookies.encrypted[:current_user_id] = nil

    redirect_to root_path
  end
end
