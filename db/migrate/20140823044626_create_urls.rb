class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.integer :chapter_id
      t.integer :order
      t.text :content
      t.text :link
      t.text :title

      t.timestamps
    end
  end
end
