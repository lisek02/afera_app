class ChangeGroupNameFormat < ActiveRecord::Migration
	def up
		change_column :groups, :name, :string
	end

	def down
		change_column :groups, :name, :integer
	end
end
