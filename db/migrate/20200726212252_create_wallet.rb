class CreateWallet < ActiveRecord::Migration[6.0]
  def change
    create_table :wallets do |t|
      t.string :paper
      t.float :quantity

      t.timestamps
    end
  end
end
