class CreateTerms < ActiveRecord::Migration
  def self.up
    create_table :terms, :id => false, :force => true do |t|
      t.string :id
      t.string :name
      t.string :abrev
      t.text :description

      t.timestamps
    end
    add_index :terms, :id
    add_index :terms, :name
    add_index :terms, :abrev
    Term.reset_column_information
    open('db/terms.txt') do |f|
      f.each_line do |line|
        id, name, abrev, tags, desc = line.split(/\|/)
        Term.create :id => id, :name => name, :abrev => abrev, :description => desc
      end
    end

  end

  def self.down
    drop_table :terms
  end
end
