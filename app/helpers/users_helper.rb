module UsersHelper
  def gravatar_for(user)
    image_tag(Gravatar.new(user.email).image_url, class: 'gravatar')
  end

  def group_list(user)
    groups = Hash[user.groups.map { |group| [group.id, group.name] }]
  end
end
