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