class CreateCharacters < ActiveRecord::Migration
  def self.up
    create_table :characters do |t|
      t.references :user
      t.string :name
      t.integer :str
      t.integer :dex
      t.integer :con
      t.integer :int
      t.integer :wis
      t.integer :cha

      t.timestamps
    end
  end

  def self.down
    drop_table :characters
  end
end
