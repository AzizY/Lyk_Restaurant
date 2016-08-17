class CreateFoodsPlaces < ActiveRecord::Migration[5.0]
  def change
    create_join_table :foods, :places
    end
end
