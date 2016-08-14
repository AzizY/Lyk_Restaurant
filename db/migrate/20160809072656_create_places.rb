class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.date :estanlished_at
      t.string :phone_number
      t.string :contact_mail
      t.string :city
      t.text :description

      t.timestamps
    end
  end
end
