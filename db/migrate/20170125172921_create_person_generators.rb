class CreatePersonGenerators < ActiveRecord::Migration[5.0]
  def change
    create_table :person_generators do |t|
      t.string :status
      t.integer :total_count
      t.integer :current_count
      t.text :first_names
      t.text :last_names
      t.text :addresses

      t.timestamps
    end
  end
end
