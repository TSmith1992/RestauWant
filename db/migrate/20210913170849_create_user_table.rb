class CreateUserTable < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.belongs_to :hiringcheck, foreign_key: true
      t.string :full_name
      t.text :phone_number
      t.text :email
      t.text :description
      t.text :profile_pic
      t.text :linkedin_link
    end
  end
end
