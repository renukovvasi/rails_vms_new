class AddColumnsToHrm < ActiveRecord::Migration[5.1]
  def change
    add_column :hrms, :work_group, :string
    add_column :hrms, :business_unit, :string
    add_column :hrms, :job_id, :string
    add_column :hrms, :job_title, :string
  end
end
