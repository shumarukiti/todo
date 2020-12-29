class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.references :user, null: false
      t.string :name
      t.text :overview

      t.timestamps
    end
  end
end
