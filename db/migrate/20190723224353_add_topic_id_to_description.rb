class AddTopicIdToDescription < ActiveRecord::Migration[5.2]
  def change
    add_column :descriptions, :topic_id, :integer
  end
end
