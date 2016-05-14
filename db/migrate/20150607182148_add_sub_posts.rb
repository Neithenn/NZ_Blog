class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :subtitle
      t.text :content
      t.string :img
      t.string :category

      t.timestamps null: false
    end
  end
end
