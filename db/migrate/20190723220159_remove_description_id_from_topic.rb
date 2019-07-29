class RemoveDescriptionIdFromTopic < ActiveRecord::Migration[5.2]
  def change
    remove_column :topics, :description_id, :integer
  end
end
