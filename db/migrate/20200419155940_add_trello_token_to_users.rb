class AddTrelloTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :trello_token, :string
  end
end
