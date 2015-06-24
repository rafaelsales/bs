class CreateAlexaTopSites < ActiveRecord::Migration
  def change
    create_table :alexa_top_sites do |t|
      t.string :url, null: false
      t.integer :rank, null: false
      t.integer :page_views_per_million
      t.decimal :page_views_per_user, precision: 6, scale: 2
      t.timestamps
    end

    add_index :alexa_top_sites, :url, unique: true
    add_index :alexa_top_sites, :rank, unique: true
  end
end
