class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :word, null: false
      t.string :source, null: false
      t.string :who, null: false
      t.string :category, null: false
      t.text :episode
      t.string :genre
      t.integer :status, default: 1, null: false, limit: 1
      t.integer :user_id

      t.timestamps
    end
  end
end
