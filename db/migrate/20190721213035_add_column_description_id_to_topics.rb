class AddColumnDescriptionIdToTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :description_id, :integer
  end
end
