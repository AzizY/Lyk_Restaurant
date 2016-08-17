class CreateSocialProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :social_profiles do |t|
      t.references :place, foreign_key: true
      t.string :facebook
      t.string :twitter
      t.string :instagram
      t.string :foursquare

      t.timestamps
    end
  end
end
