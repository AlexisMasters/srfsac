class CreateDailyQuotes < ActiveRecord::Migration

  def self.up
    create_table :daily_quotes do |t|
      t.integer :month
      t.integer :day
      t.string :theme
      t.text :quote
      t.string :author
      t.string :source
      t.integer :position

      t.timestamps
    end

    add_index :daily_quotes, :id

    #load(Rails.root.join('db', 'seeds', 'daily_quotes.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "daily_quotes"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/daily_quotes"})
    end

    drop_table :daily_quotes
  end

end
