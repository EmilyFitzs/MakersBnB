feature 'booking a property' do
  scenario 'user can book a property' do
    user = User.create(email: 'test1@example.com', password: 'password123')
    properties = Bnb.create(name: 'room60', description: 'the sixtieth room', price: '6000')
    visit('/properties')
    # ********* Dates/Availabilty *************

  scenario 'user can see the proeprty they want to book' do
   # ******** User has to be signed in ***********
    propertrty = Bnb.create(name: 'room60', description: 'the sixtieth room', price: '6000')
    visit '/property'
    click_button('Request Booking')
    expect(page).to have_content ''
