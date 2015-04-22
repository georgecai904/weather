class AddSourcetypeToDatasource < ActiveRecord::Migration
  def change
    add_reference :datasources, :sourcetype, index: true, foreign_key: true
  end
end
