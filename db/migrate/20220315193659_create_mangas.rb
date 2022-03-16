class CreateMangas < ActiveRecord::Migration
  def change
    create_table :mangas do |t|
      t.string :title
      t.text :synopsis
      t.string :character_list
      t.integer :release_year
      t.string :image_url
      t.belongs_to :author

      t.timestamps null: false
    end
  end
end
