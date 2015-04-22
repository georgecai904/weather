class CreateSourcetypes < ActiveRecord::Migration
  def change
    create_table :sourcetypes do |t|
      t.string :type_name

      t.timestamps null: false
    end
  end
end
