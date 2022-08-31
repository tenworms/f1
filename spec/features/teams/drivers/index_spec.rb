require 'rails_helper'

RSpec.describe 'Team drivers index page ' do
  it 'shows each childs attributes that is associated with the parent' do
    redbull = Team.create!(name: "Redbull", currently_leading: true, championships_won: 4)

    schumi = redbull.drivers.create!(name: "Michael Schumaker", up_for_hire: true, drivers_age: 19)
    albon = redbull.drivers.create!(name: "Alex Albon", up_for_hire: false, drivers_age: 20)

    visit "/teams/#{redbull.id}/drivers"

    expect(page).to have_content(schumi.name)
    expect(page).to have_content(albon.name)
  end

  it 'has a link to add a new driver' do
    redbull = Team.create!(name: "Redbull", currently_leading: true, championships_won: 4)

    schumi = redbull.drivers.create!(name: "Michael Schumaker", up_for_hire: true, drivers_age: 19)
    albon = redbull.drivers.create!(name: "Alex Albon", up_for_hire: false, drivers_age: 20)

    visit "/teams/#{redbull.id}/drivers"


    expect(page).to have_content("Add a driver")

    click_link "Add a driver"

    expect(current_path).to eq("/teams/#{redbull.id}/drivers/new")
  end


end
