class AddPatternToDatasource < ActiveRecord::Migration
  def change
    add_reference :datasources, :pattern, index: true, foreign_key: true
  end
end
