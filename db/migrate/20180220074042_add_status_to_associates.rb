class AddStatusToAssociates < ActiveRecord::Migration[5.1]
  def change
    add_column :associates, :status, :string
  end
end
