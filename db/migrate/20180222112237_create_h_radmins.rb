class CreateHRadmins < ActiveRecord::Migration[5.1]
  def change
    create_table :h_radmins do |t|
      t.string :email
      t.string :username
      t.string :password
      t.timestamps
    end
  end
end
