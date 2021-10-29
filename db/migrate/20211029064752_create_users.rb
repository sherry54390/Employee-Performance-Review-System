class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :cnic
      t.string :role
      t.date :joining_date


      t.timestamps
    end
  end
end
