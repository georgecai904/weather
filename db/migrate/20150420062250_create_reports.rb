class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.datetime :time
      t.float :temperature
      t.float :dew_point
      t.string :wind_direction
      t.float :wind_speed

      t.timestamps null: false
    end
  end
end
