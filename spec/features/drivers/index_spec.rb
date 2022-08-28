require 'rails_helper'


RSpec.describe 'Drivers index page' do
  it 'shows each child and their attributes' do
    redbull = Team.create!(name: "Redbull", currently_leading: true, championships_won: 4)

    schumi = redbull.drivers.create!(name: "Michael Schumaker", up_for_hire: true, drivers_age: 19)
    albon = redbull.drivers.create!(name: "Alex Albon", up_for_hire: false, drivers_age: 20)

    visit "/drivers"

    expect(page).to have_content(schumi.name)
    expect(page).to have_content(schumi.up_for_hire)
    expect(page).to have_content(schumi.drivers_age)
    expect(page).to have_content(albon.name)
    expect(page).to have_content(albon.up_for_hire)
    expect(page).to have_content(albon.drivers_age)
  end
end
