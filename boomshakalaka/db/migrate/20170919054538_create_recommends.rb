class CreateRecommends < ActiveRecord::Migration[5.1]
  def change
    create_table :recommends do |t|
      t.text :tag

      t.timestamps
    end
  end
end
