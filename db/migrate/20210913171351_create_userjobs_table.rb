class CreateUserjobsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :userjobs do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :job, foreign_key: true
    end
  end
end
