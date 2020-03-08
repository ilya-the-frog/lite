class CreateRktRates < ActiveRecord::Migration[6.0]
  def change
    create_table :rkt_rates do |t|

      t.timestamps
    end
  end
end
