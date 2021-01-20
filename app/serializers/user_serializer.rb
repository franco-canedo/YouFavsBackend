class UserSerializer < ActiveModel::Serializers
    attributes :id, :uid, :email, :name, :image_url, :google_token, :google_refresh_token
end