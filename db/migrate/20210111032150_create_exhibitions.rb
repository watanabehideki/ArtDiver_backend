class CreateExhibitions < ActiveRecord::Migration[6.0]
  def change
    create_table :exhibitions do |t|
      t.text :title
      t.text :content
      t.string :tel
      t.date :start_date
      t.date :end_date
      t.string :open_time
      t.string :holiday
      t.text :url
      t.string :admission
      t.references :gallery, null: false, foreign_key: true

      t.timestamps
    end
    add_index :exhibitions, [:gallery_id, :created_at]
  end
end
