class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name, null: false, default: ""

      t.timestamps
    end

    add_index(:countries, :name)
  end
end
