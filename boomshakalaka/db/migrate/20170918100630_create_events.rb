class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.text :title
      t.text :tag
      t.integer :coin
      t.integer :view
      t.integer :favorite

      t.timestamps
    end
  end
end
