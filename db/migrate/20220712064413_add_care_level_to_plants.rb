class AddCareLevelToPlants < ActiveRecord::Migration[6.1]
  def change
    add_column :plants, :care_level, :string
  end
end
