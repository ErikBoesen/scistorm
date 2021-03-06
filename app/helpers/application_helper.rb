module ApplicationHelper

    # Returns the full title on a per-page basis.
    def full_title(page_title = '')
        base_title = "SciStorm"
        if page_title.empty?
            base_title
        else
            page_title + " | " + base_title
        end
    end

    def user_path(user)
        "/u/#{user.username}"
    end

    def edit_user_path(user)
        "/u/#{user.username}/edit"
    end

    def community_path(community)
        "/communities/#{community.id}"
    end

  # Returns the Gravatar for the given user.
  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
