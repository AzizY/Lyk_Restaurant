class AddOwnerIdToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :owner_id, :integer
    add_foreign_key :places, :owners
  end
end
