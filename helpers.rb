def check_authenticated(session:)
  user = nil
  if session.has_key?(:user_id)
    user = User.find(id: session[:user_id])
  end

  if user
    return user
  else
    flash[:notice] = 'Please sign in.'
    redirect('/signin')
  end
end

def sign_up
  visit '/signup'
  fill_in(:email, with: 'test10@example.com')
  fill_in(:password, with: 'password123')
  fill_in(:password_confirmation, with: 'password123')
  click_button('Sign Up')
end

def sign_in
  visit '/signin'
  fill_in(:email, with: 'test10@example.com')
  fill_in(:password, with: 'password123')
  click_button('Sign in')
end