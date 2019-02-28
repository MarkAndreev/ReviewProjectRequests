class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.string :name
      t.string :email
      t.text :description
      t.integer :rating

      t.timestamps
    end
  end
end
