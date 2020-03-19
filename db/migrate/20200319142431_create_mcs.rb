class CreateMcs < ActiveRecord::Migration[6.0]
  def change
    create_table :mcs do |t|

      t.timestamps
    end
  end
end
