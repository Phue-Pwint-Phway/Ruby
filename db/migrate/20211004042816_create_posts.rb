class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.integer :status
      t.integer :create_user_id
      t.integer :updated_user_id
      t.integer :deleted_user_id

      t.timestamps
    end
  end
end
