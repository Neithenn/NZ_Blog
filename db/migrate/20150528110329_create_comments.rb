
class CreateComments < ActiveRecord::Migration
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
    def change
    create_table :comments do |t|
      t.string :name
      t.string :body
  
      t.timestamps null: false
    end
  end
end

