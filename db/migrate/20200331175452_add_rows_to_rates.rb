class AddRowsToRates < ActiveRecord::Migration[6.0]
  def change
    change_table :rates do |t|
    t.date :date
    t.string :sum
    t.string :curr
    t.string :mcrate
    t.string :mcamount
    end
  end
end
