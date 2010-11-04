class CreateCharacters < ActiveRecord::Migration
  def self.up
    create_table :characters, :force => true do |t|
      t.references :user
      t.string :name
      t.references :campaign
      t.references :race
      t.references :cclass
      t.references :alignment
      t.references :size
      t.references :gender
      t.integer :height
      t.integer :weight
      t.string :eye_color
      t.string :hair_color
      t.integer :age

      t.timestamps
    end
  end

  def self.down
    drop_table :characters
  end
end
