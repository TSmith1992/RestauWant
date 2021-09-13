class CreateRestaurantsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name
      t.string :borough_location
      t.text :price_range
      t.text :picture
      t.text :type
    end
  end
end
