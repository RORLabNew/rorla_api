class CreateScraps < ActiveRecord::Migration
  def change
    create_table :scraps do |t|
      t.string :title, null: false
      t.text :description
      t.string :url, null: false
      t.boolean :shared, default: true
      t.references :scraper, index: true

      t.timestamps
    end
  end
end
