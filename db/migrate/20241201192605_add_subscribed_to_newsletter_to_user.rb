class AddSubscribedToNewsletterToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :subscribed_to_newsletter, :boolean, default: :false
  end
end
