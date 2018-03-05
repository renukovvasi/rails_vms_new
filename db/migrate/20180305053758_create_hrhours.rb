class CreateHrhours < ActiveRecord::Migration[5.1]
  def change
    create_table :hrhours do |t|
      t.integer :hours
      t.string :associate_id
      t.string :project_id
      t.timestamp :date
      t.timestamps
    end
  end
end
