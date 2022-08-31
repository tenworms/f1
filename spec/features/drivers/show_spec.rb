require 'rails_helper'

RSpec.describe 'Drivers show page' do
  it 'I see only the child with corresponding id attributes' do
    redbull = Team.create!(name: "Redbull", currently_leading: true, championships_won: 4)
    schumi = redbull.drivers.create!(name: "Michael Schumaker", up_for_hire: true, drivers_age: 19)
    albon = redbull.drivers.create!(name: "Alex Albon", up_for_hire: false, drivers_age: 20)

    visit "/drivers/#{schumi.id}"

    expect(page).to have_content(schumi.name)
    expect(page).to have_content(schumi.up_for_hire)
    expect(page).to have_content(schumi.drivers_age)
    expect(page).to_not have_content(albon.drivers_age)
  end

  it 'shows a link to update the driver' do
    redbull = Team.create!(name: "Redbull", currently_leading: true, championships_won: 4)
    schumi = redbull.drivers.create!(name: "Michael Schumaker", up_for_hire: true, drivers_age: 19)
    albon = redbull.drivers.create!(name: "Alex Albon", up_for_hire: false, drivers_age: 20)

    visit "/drivers/#{schumi.id}"

    expect(page).to have_content("Update #{schumi.name}")
  end

end
