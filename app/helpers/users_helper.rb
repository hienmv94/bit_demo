module UsersHelper

# Returns the Gravatar for the given user.
  def gravatar_for(user)
	gravatar_id = Digest::MD5::hexdigest(user.uid)
  	gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
	image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
  
  def logged_in_user
 	redirect_to root_url unless current_user
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user
  end

  # Confirms an admin user.
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end