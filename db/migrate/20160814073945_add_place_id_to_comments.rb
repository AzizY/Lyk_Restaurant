class AddPlaceIdToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :place_id, :integer
    add_foreign_key :comments, :places
  end
end
