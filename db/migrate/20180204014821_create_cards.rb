class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :card_used

      t.timestamps
    end
  end
end
