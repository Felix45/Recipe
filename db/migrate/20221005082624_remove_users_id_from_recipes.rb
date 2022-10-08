class RemoveUsersIdFromRecipes < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipes, :users_id, :bigint
  end
end
