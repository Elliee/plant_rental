class AddLightToPlants < ActiveRecord::Migration[6.1]
  def change
    add_column :plants, :light, :string
  end
end
