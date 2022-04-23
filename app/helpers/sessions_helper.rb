module SessionsHelper

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
      !current_user.nil?
  end

  # Confirms a logged-in user.
  def logged_in_user
     unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to splash_index_path
     end
  end

end
