class AddEpisodeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :episode, :string
  end
end
