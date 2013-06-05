class CreateBrigades < ActiveRecord::Migration
  def change
    create_table :brigades do |t|
      t.string :name, null: false, default: ""
      t.integer :workers, null: false, default: 0
      t.integer :cost, null: false, default: 0
      t.references :country

      t.timestamps
    end

    add_index :brigades, :country_id
  end
end
