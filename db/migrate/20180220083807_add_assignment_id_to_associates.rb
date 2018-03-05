class AddAssignmentIdToAssociates < ActiveRecord::Migration[5.1]
  def change
     add_column :associates, :assignment_id, :string
  end
end
