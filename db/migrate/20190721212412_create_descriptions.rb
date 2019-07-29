class CreateDescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :descriptions do |t|
      t.text :desc

      t.timestamps
    end
  end
end
