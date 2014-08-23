class CreateHeadings < ActiveRecord::Migration
  def change
    create_table :headings do |t|
      t.integer :chapter_id
      t.integer :order
      t.integer :level
      t.text :content

      t.timestamps
    end
  end
end
