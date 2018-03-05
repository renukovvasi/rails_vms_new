class CreateHours < ActiveRecord::Migration[5.1]
  def change
    create_table :hours do |t|
      t.integer :hours
      t.string :associate_id
      t.string :project_id
      t.timestamp :date
    end
  end
end
