class RenameProspectsToContacts < ActiveRecord::Migration
  def change
    rename_table :prospects, :contacts
  end
end
