class DateToDatetimeInRates < ActiveRecord::Migration[6.0]
  def change
    remove_column :rates, :date, :date
    add_column :rates, :date, :datetime, null: false
  end
end
