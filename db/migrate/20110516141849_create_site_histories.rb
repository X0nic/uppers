class CreateSiteHistories < ActiveRecord::Migration
  def self.up
    create_table :site_histories do |t|
      t.integer :code
      t.datetime :checked_date

      t.timestamps
    end
  end

  def self.down
    drop_table :site_histories
  end
end
