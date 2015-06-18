class CreateProspects < ActiveRecord::Migration
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')

    create_table :prospects do |t|
      t.string :email
      t.string :list_name
      t.hstore :data

      t.timestamps null: false
    end

    add_index :prospects, :email
    add_index :prospects, :list_name
  end
end
