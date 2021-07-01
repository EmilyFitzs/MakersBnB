feature 'sign in' do
  it 'a user can sign in' do
    User.create(email: 'test@example.com', password: 'password123')

    visit '/signin'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')
    expect(page).to have_content 'Welcome, test@example.com'

    click_button('Sign out')
    expect(page).not_to have_content 'Welcome, test@example.com'
  end

  it 'can log out and user has to log back in' do
  visit '/signin'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')
    expect(page).to have_content 'Welcome, test@example.com'

    click_button('Sign out')
    visit '/'
    expect(page).to have_content 'Please sign in.'
  end

  it 'can check user logs in with correct passwords' do
  visit '/signin'
  fill_in(:email, with: 'test@example.com')
  fill_in(:password, with: 'am_I_a_teapot?')
  click_button('Sign in')
  expect(page).to have_content 'Username or password is incorrect'
  end
end

feature 'sign up' do
  it 'allows user to sign up' do
    User.truncate
    visit '/signup'
    fill_in(:email, with: 'test7@example.com')
    fill_in(:password, with: 'password123')
    fill_in(:password_confirmation, with: 'password123')
    click_button('Sign Up')
    expect(page).to have_content 'Welcome, test7@example.com'
    end  

  it 'checks email is unique on signup' do
    visit '/signup'
    fill_in(:email, with: 'test7@example.com')
    fill_in(:password, with: 'password123')
    fill_in(:password_confirmation, with: 'password123')
    click_button('Sign Up')
    expect(page).to have_content 'A user already exists with this email'
  end
end
