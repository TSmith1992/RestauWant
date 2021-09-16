class AddFullNameOfHmColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :hiring_managername, :text
  end
end
