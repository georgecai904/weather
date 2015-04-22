class AddDatasourceToReport < ActiveRecord::Migration
  def change
    add_reference :reports, :datasource, index: true, foreign_key: true
  end
end
