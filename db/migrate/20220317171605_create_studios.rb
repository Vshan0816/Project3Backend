class CreateStudios < ActiveRecord::Migration[5.2]
  def change
    create_table :studios do |t|
      t.string :name
      t.integer :year_founded

      t.timestamps null: false
    end
  end
end
