class CreateLocationPaths < ActiveRecord::Migration[5.0]
  def change
    create_table :location_paths do |t|
      # t.uuid      :parent, null: false
      # t.uuid      :child, null: false

      t.references :parent, type: :uuid, null: false, index: true, foreign_key: false
      t.references :child, type: :uuid, null: false, index: true, foreign_key: false
      t.timestamps
    end
    add_foreign_key :location_paths, :locations, column: 'parent_id', primary_key: 'uuid'
    add_foreign_key :location_paths, :locations, column: 'child_id', primary_key: 'uuid'    

    add_index :location_paths, [:parent_id, :child_id], :unique => true, :name => 'idx_location_paths_parent_child'
  end
end
