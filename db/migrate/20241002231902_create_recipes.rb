class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :ingredients
      t.text :directions
      t.integer :user_id

      t.timestamps
    end
  end
end