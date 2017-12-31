class AddCharacterInfoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :characterfirstname, :string
    add_column :users, :characterlastname, :string
  end
end
