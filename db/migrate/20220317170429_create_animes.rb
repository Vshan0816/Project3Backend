class CreateAnimes < ActiveRecord::Migration
  def change
    create_table :animes do |t|
      t.string :title
      t.text :synopsis
      t.integer :release_year
      t.integer :total_episodes
      t.string :image_url
      t.belongs_to :studio

      t.timestamps null: false
    end
  end
end
