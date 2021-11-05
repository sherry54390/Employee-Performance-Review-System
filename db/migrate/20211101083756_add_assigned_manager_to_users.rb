class AddAssignedManagerToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :assigned_manager, :string
  end
end
