class CreateCurrencies < ActiveRecord::Migration[6.1]
  def change
    create_table :currencies do |t|
      t.string :timestamp
      t.string :currency
      t.decimal :value

      t.timestamps
    end
  end
end
