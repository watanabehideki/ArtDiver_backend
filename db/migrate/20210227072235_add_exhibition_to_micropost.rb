class AddExhibitionToMicropost < ActiveRecord::Migration[6.0]
  def change
    add_reference :microposts, :exhibition, foreign_key: true, null: false
  end
end
