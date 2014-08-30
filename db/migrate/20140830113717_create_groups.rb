class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :name
      t.string :description

      t.timestamps
    end
  end
end
