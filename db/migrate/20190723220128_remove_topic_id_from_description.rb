class RemoveTopicIdFromDescription < ActiveRecord::Migration[5.2]
  def change
    remove_column :descriptions, :topic_id, :integer
  end
end
