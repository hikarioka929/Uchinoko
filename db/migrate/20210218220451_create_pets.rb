class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.text :introduction
      t.integer :sex
      t.integer :age
      t.string :image_id
      t.integer :user_id
      t.integer :genre_id
      t.timestamps
    end
  end
end
