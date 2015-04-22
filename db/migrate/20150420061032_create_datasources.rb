class CreateDatasources < ActiveRecord::Migration
  def change
    create_table :datasources do |t|
      t.string :name
      t.string :url
      t.string :api

      t.timestamps null: false
    end
  end
end
