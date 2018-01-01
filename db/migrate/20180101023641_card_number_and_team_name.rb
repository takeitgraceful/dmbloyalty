class CardNumberAndTeamName < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :card_number, :string
    add_column :users, :team_name, :string
  end
end
