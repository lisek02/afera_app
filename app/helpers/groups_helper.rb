module GroupsHelper
	def user_list(group)
    users = Hash[group.users.map { |user| [user.id, user.login] }]
  end
end
