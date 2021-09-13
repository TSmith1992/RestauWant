class CreateHiringManagerCheckTable < ActiveRecord::Migration[6.1]
  def change
    create_table :hiringchecks do |t|
      t.boolean :manager?
    end
  end
end
