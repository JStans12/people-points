class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :image_link
      t.integer :points
      t.integer :tokens
      t.integer  "role", default: 0

      t.timestamps
    end
  end
end
