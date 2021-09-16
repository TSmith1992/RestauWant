class AddHiringManagerColumnToJobsTable < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :hiring_managerid, :integer 
  end
end
