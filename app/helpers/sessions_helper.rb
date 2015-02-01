module SessionsHelper
  def sign_in(member)
    remember_token = Member.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    member.update_attribute(:remember_token, Member.encrypt(remember_token))
    self.current_user = member
  end

  def current_user=(member)
    @current_user = member
  end

  def current_user
    remember_token = Member.encrypt(cookies[:remember_token])
    @current_user ||= Member.find_by(remember_token: remember_token)    
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end
end
