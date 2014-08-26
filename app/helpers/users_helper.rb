module UsersHelper
	def gravatar_for(user)
		image_tag(Gravatar.new(user.email).image_url, class: 'gravatar')
	end
end
