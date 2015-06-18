class CreateProspects < ActiveRecord::Migration
  def change
    create_table :prospects do |t|
      t.string :email
      t.string :list_name
      t.json :data

      t.timestamps null: false
    end

    add_index :prospects, :email
    add_index :prospects, :list_name
  end
end
