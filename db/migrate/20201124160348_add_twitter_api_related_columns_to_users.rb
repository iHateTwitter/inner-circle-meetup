class AddTwitterApiRelatedColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :token, :string
    add_column :users, :secret, :string
  end
end
