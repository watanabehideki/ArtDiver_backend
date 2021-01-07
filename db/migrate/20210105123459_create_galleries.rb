class CreateGalleries < ActiveRecord::Migration[6.0]
  def change
    create_table :galleries do |t|
      t.string :name
      t.string :email, :null => false, :default => ""
      t.text :content 
      t.string :location
      t.string :tel
      t.string :open_time
      t.string :holiday
      t.text :url

      t.timestamps
    end
  end
end
