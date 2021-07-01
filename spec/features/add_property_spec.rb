# require_relative '../helpers_spec'

def sign_up
  visit '/signup'
  fill_in(:email, with: 'test8@example.com')
  fill_in(:password, with: 'password123')
  fill_in(:password_confirmation, with: 'password123')
  click_button('Sign Up')
end

def sign_in
  visit '/signin'
  fill_in(:email, with: 'test@example.com')
  fill_in(:password, with: 'password123')
  click_button('Sign in')
end

feature 'Adding a space' do
  scenario 'Adds a room or property to the properties page' do
    sign_up
    # sign_in
    visit('/properties/add')
    fill_in('name', with: 'Room')
    fill_in('description', with: 'its a room')
    fill_in('price', with: '132')
    fill_in('availability_start', with: '2021-09-02')
    fill_in('availability_end', with: '2021-10-02')

    click_button('Submit')
    
    expect(page).to have_content 'Room'
    expect(page).to have_content 'its a room'
    expect(page).to have_content '132'
  end

  scenario 'Check that user is logged in before adding property' do
  end
    
end