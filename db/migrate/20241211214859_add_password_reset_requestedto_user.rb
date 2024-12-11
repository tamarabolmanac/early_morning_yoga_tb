class AddPasswordResetRequestedtoUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :password_reset_requested, :boolean, default: :false
  end
end
