module UsersHelper
  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user, options={size: 48})
  	#gravatar users email address to md5 in order to return your gravatar
  	default_url = "#{root_url}images/guest.png"
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    #for production
    #gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}&d=#{CGI.escape(default_url)}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
