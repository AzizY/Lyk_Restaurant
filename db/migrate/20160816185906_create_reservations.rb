class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.date :date
      t.integer :number_of_people
      t.references :customer, foreign_key: true
      t.references :place, foreign_key: true

      t.timestamps
    end
  end
end
