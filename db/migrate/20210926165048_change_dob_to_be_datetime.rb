class ChangeDobToBeDatetime < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :dob, :datetime
  end
end
