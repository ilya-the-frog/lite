class CreateRates < ActiveRecord::Migration[6.0]
  def change
    create_table :rates do |t|
      t.date :date
      t.string :sum
      t.string :curr
      t.string :mcrate
      t.string :mcamount

      t.timestamps
    end
  end
end
