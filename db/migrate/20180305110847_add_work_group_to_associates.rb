class AddWorkGroupToAssociates < ActiveRecord::Migration[5.1]
  def change
    add_column :associates, :work_group, :string
  end
end
