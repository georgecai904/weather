class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.datetime :datetime

      t.timestamps null: false
    end
  end
end
