class DateToRates < ActiveRecord::Migration[6.0]
  def change
    add_column :rates, :date, :date
  end
end
