require 'rails_helper'

RSpec.describe 'Team drivers new driver' do
  it 'can fill attributes and create new driver belonging to the team' do
    redbull = Team.create!(name: "Redbull", currently_leading: true, championships_won: 4)
    schumi = redbull.drivers.create!(name: "Michael Schumaker", up_for_hire: true, drivers_age: 19)
    albon = redbull.drivers.create!(name: "Alex Albon", up_for_hire: false, drivers_age: 20)

    visit "/teams/#{redbull.id}/drivers/new"
    fill_in 'Name', with: 'Lewis Hamilton'
    select 'false', from: 'Up for hire'
    fill_in 'Drivers age', with: 33
    click_on 'Create driver'

    expect(current_path).to eq("/teams/#{redbull.id}/drivers")
    expect(page).to have_content('Lewis Hamilton')
    expect(page).to have_content('false')
    expect(page).to have_content(33)

  end
end
