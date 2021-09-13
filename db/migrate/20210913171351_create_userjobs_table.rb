class CreateUserjobsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :userjobs do |t|
      t.belongs_to :user_id, foreign_key: true
      t.belongs_to :job_id, foreign_key: true
    end
  end
end
