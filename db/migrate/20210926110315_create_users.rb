class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.text :profile
      t.string :type
      t.string :phone
      t.text :address
      t.date :dob
      t.integer :create_user_id
      t.integer :updated_user_id
      t.integer :deleted_user_id

      t.timestamps
    end
  end
end
