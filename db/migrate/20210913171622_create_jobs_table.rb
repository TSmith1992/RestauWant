class CreateJobsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.belongs_to :restaurant_id, foreign_key: true
      t.string :name
      t.string :type
      t.integer :pay
      t.text :description
      t.date :desired_start_date
    end
  end
end
