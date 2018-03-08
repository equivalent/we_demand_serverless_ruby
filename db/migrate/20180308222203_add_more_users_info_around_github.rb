class AddMoreUsersInfoAroundGithub < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :avatar_url, :string
    add_column :users, :username, :string
    add_column :users, :url, :string
  end
end
