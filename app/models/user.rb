class User < ApplicationRecord
    has_many :categories 
    has_many :videos, through: :categories

    def self.create_from_omniauth(auth)
        # Creates a new user only if it doesn't exist
        where(email: auth['email']).first_or_initialize do |user|
            user.uid = auth['googleId']
            user.name = auth['givenName']
            user.email = auth['email']
            user.image_url = auth['imageUrl']
        end
    end
end
