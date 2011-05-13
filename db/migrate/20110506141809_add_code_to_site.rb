class AddCodeToSite < ActiveRecord::Migration
  def self.up
    add_column :sites, :code, :integer
  end

  def self.down
    remove_column :sites, :code
  end
end
