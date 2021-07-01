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

feature 'viewing properties' do
  scenario 'properties are visible onscreen' do
    sign_in
    Bnb.create(name: 'villa', description: 'villa one', price: '1000', availability_start: "2021-07-01", availability_end: "2021-10-02", user_id: 1)
    visit '/properties'
    expect(page).to have_content 'villa'
  end
end
