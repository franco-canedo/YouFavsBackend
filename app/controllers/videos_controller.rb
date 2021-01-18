class VideosController < ApplicationController
    def create 
        user = User.find(current_user.id)
        video = Video.create(title: params[:title], source: params[:source])
        category_video = CategoryVideo.create(category_id: params[:category_id], video_id: video.id)

        if video.valid? && category_video.valid?
            render json: video
        else 
            render json: {error: 'could not add video'}, status: :failed
        end 

    end 

    private
    def video_params
        params.permit(:title, :source, :category_id)
    end 
end
