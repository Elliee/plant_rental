class AddPetFriendlyToPlants < ActiveRecord::Migration[6.1]
  def change
    add_column :plants, :pet_friendly, :string
  end
end
