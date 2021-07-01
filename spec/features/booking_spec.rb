require './helpers'

feature 'booking a property' do
  scenario 'user can book a property' do
    sign_in
    Bnb.create(name: 'villa', description: 'villa one', price: '1000', availability_start: "2021-07-01", availability_end: "2021-10-02", user_id: 1)
    visit('/properties')
    click_button 'Make Request'
    expect(page).to have_content 'Your request has been sent'
  end
end
