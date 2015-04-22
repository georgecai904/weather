class CreatePatterns < ActiveRecord::Migration
  def change
    create_table :patterns do |t|
      t.string :station_name
      t.string :time
      t.string :temperature
      t.string :dew_point
      t.string :wind_direction
      t.string :wind_speed

      t.timestamps null: false
    end
  end
end
