class CreateAssociates < ActiveRecord::Migration[5.1]
  def change
    create_table :associates do |t|
      t.string :associate_name
      t.string :associate_id
      t.string :project_id
      t.timestamp :start_date
      t.timestamp :end_date
      t.string :cust_id
      t.string :payroll_center
      t.string :business_unit

      t.timestamps
    end
  end
end
