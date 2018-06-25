class CreateForecastWeathers < ActiveRecord::Migration[5.2]
  def change
    create_table :forecast_weathers do |t|
      t.string :citi_name
      t.integer :citi_id

      t.timestamps
    end
  end
end
