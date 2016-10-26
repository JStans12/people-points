class CreateEndorsements < ActiveRecord::Migration[5.0]
  def change
    create_table :endorsements do |t|
      t.text :body
      t.string :endorser

      t.timestamps
    end
  end
end
