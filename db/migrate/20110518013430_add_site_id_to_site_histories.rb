class AddSiteIdToSiteHistories < ActiveRecord::Migration
  def self.up
    add_column :site_histories, :site_id, :integer
  end

  def self.down
    remove_column :site_histories, :site_id
  end
end
