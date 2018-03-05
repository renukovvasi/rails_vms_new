class CreateContentStats < ActiveRecord::Migration[5.1]
  def change
    create_table :content_stats do |t|
      t.string :associate_id
      t.string :associate_name
      t.string :assignment_id
      t.string :project_id
      t.timestamp :date
      t.integer :hours
      t.string :status
      
      t.timestamps
    end
  end
end
