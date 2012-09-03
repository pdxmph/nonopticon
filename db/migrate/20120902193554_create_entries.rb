class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.string :title
      t.text :note
      t.float :latitude
      t.float :longitude
      t.string :url
      t.string :kind
      t.date :date
      t.string :source

      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
