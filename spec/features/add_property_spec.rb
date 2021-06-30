feature 'Adding a space' do
  scenario 'Adds a room or property to the properties page' do
    visit('properties/add')
    fill_in('name', with: 'Room')
    fill_in('description', with: 'its a room')
    fill_in('price', with: '132')
    click_button('Submit')
    
    expect(page).to have_content 'Room'
    expect(page).to have_content 'its a room'
    expect(page).to have_content '132'
  end
end