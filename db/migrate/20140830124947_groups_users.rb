class GroupsUsers < ActiveRecord::Migration
  def change
  	create_table :groups_users, :id => false do |t|
  		t.references :group
  		t.references :user
  		t.timestamp
  	end
  end
end
