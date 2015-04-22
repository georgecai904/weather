class AddStationToReport < ActiveRecord::Migration
  def change
    add_reference :reports, :station, index: true, foreign_key: true
  end
end
