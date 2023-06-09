class CreateWinners < ActiveRecord::Migration[7.0]
  def change
    create_table :winners do |t|
      t.references :item
      t.references :bet
      t.references :address
      t.integer :item_batch_count
      t.string :state
      t.decimal :price, default: 0, precision: 18, scale: 2
      t.integer :paid_at
      t.references :admin
      t.string :picture
      t.string :comment
      t.timestamps
    end
  end
end
