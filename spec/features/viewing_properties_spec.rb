feature 'viewing properties' do
  scenario 'properties are visible onscreen' do
    Bnb.create(name: 'villa', description: 'villa one', price: '1000')
    visit '/properties'
    expect(page).to have_content 'villa'
  end
end
