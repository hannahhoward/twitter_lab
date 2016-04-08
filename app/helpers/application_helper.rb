module ApplicationHelper
  # Returns the Gravatar for the given user.
  def gravatar_for(user, size = nil, high_res = false)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    if size
      if high_res
        gravatar_id += "?s=#{size*2}"
      else
        gravatar_id += "?s=#{size}"
      end
    end
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar", style: (size ? "width: #{size}px" : ""))
  end
end
