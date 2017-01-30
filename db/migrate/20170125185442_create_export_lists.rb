class CreateExportLists < ActiveRecord::Migration[5.0]
  def change
    create_table :export_lists do |t|
      t.integer :exported_count
      t.integer :total_count
      t.string :file_url
      t.string :status

      t.timestamps
    end
  end
end
