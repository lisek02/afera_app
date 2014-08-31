class Group < ActiveRecord::Base
	has_and_belongs_to_many :users, join_table: :group_users_table
	validates :name, presence: true
end
