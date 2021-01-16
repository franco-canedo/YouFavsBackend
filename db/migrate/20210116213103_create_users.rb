class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :email
      t.string :name
      t.string :image_url
      t.string :google_token
      t.string :google_refresh_token

      t.timestamps
    end
  end
end
