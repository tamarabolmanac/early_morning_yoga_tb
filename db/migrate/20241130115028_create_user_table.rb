class CreateUserTable < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.datetime :birth_date
      t.string :role

      t.timestamps
    end
  end
end