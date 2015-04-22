class AddPeriodToReport < ActiveRecord::Migration
  def change
    add_reference :reports, :period, index: true, foreign_key: true
  end
end
