class AddResponseToRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :requests, :response, :text
  end
end
