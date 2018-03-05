class CreateHrms < ActiveRecord::Migration[5.1]
  def change
    create_table :hrms do |t|
      t.string :associate_id
      t.string :associate_name
      t.string :project_id
      t.string :assignment_id
      t.timestamps
    end
  end
end
