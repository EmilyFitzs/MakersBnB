feature 'viewing properties' do
  scenario 'properties are visible onscreen' do
    sign_up
    sign_in
    Bnb.create(
      name: 'villa',
      description: 'villa one',
      price: '1000',
      availability_start: '2021-07-01',
      availability_end: '2021-10-02',
      user_id: 1
    )
    visit '/properties'
    expect(page).to have_content 'villa'
  end
end
