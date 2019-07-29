class AddColumnTitleToTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :title, :string
  end
end
