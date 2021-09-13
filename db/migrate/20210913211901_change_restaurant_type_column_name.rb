class ChangeRestaurantTypeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :restaurants, :type, :restaurant_type
  end
end
