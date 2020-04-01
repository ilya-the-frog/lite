class DateCanBeNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :rates, :date, true
  end
end
