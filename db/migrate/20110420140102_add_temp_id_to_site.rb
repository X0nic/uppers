class AddTempIdToSite < ActiveRecord::Migration
  def self.up
    add_column :sites, :temp_id, :string
  end

  def self.down
    remove_column :sites, :temp_id
  end
end
