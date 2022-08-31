require 'rails_helper'

RSpec.describe 'Driver update page' do
  it 'can update a drivers attributes' do
    redbull = Team.create!(name: "Redbull", currently_leading: true, championships_won: 4, created_at: 15.seconds.ago)
    schumi = redbull.drivers.create!(name: "Michael Schumaker", up_for_hire: true, drivers_age: 19)
    albon = redbull.drivers.create!(name: "Alex Albon", up_for_hire: false, drivers_age: 20)

    visit "/drivers/#{schumi.id}/edit"

    fill_in 'Name', with: 'Michael Schumaker'
    select 'true', from: 'Up for hire'
    fill_in 'Drivers age', with: 20
    click_on 'Update driver'

    expect(current_path).to eq("/drivers/#{schumi.id}")
    expect(page).to have_content('Michael Schumaker')
    expect(page).to have_content('true')
    expect(page).to have_content(20)
  end
end
