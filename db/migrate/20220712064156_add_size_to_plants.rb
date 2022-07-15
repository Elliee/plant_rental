class AddSizeToPlants < ActiveRecord::Migration[6.1]
  def change
    add_column :plants, :size, :string
  end
end
