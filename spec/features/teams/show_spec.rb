require 'rails_helper'

RSpec.describe 'Team Show page' do
  it 'shows a specific parent attributres' do
    redbull = Team.create!(name: "Redbull", currently_leading: true, championships_won: 4)
    mclaren = Team.create!(name: "Mclaren", currently_leading: false, championships_won: 1)

    visit "/teams/#{redbull.id}"


    expect(page).to have_content(redbull.name)
    expect(page).to have_content(redbull.currently_leading)
    expect(page).to have_content(redbull.championships_won)
    expect(page).to_not have_content(mclaren.championships_won)
  end

  it 'i see a count of the number of children for this parent' do
    redbull = Team.create!(name: "Redbull", currently_leading: true, championships_won: 4)

    schumi = redbull.drivers.create!(name: "Michael Schumaker", up_for_hire: true, drivers_age: 19)
    albon = redbull.drivers.create!(name: "Alex Albon", up_for_hire: false, drivers_age: 20)

    visit "/teams/#{redbull.id}"

    expect(page).to have_content("Driver Count: 2")
  end

  it 'has a link to the drivers index ' do
    redbull = Team.create!(name: "Redbull", currently_leading: true, championships_won: 4)
    schumi = redbull.drivers.create!(name: "Michael Schumaker", up_for_hire: true, drivers_age: 19)
    albon = redbull.drivers.create!(name: "Alex Albon", up_for_hire: false, drivers_age: 20)

    visit "/teams/#{redbull.id}"
    expect(page).to have_link('Drivers Index')
    click_link 'Drivers Index'
    expect(current_path).to eq('/drivers')
  end

  it 'displays a link that takes me to the teams index' do
    redbull = Team.create!(name: "Redbull", currently_leading: true, championships_won: 4)
    schumi = redbull.drivers.create!(name: "Michael Schumaker", up_for_hire: true, drivers_age: 19)
    albon = redbull.drivers.create!(name: "Alex Albon", up_for_hire: false, drivers_age: 20)

    visit "/teams/#{redbull.id}"
    expect(page).to have_link("Teams Index")
    click_link 'Teams Index'
    expect(current_path).to eq('/teams')
  end

  it 'displays a link that takes me to the parents child table name' do
    redbull = Team.create!(name: "Redbull", currently_leading: true, championships_won: 4)
    schumi = redbull.drivers.create!(name: "Michael Schumaker", up_for_hire: true, drivers_age: 19)
    albon = redbull.drivers.create!(name: "Alex Albon", up_for_hire: false, drivers_age: 20)

    visit "/teams/#{redbull.id}"
    expect(page).to have_link("#{redbull.name} drivers")
    click_link "#{redbull.name} drivers"
    expect(current_path).to eq("/teams/#{redbull.id}/drivers")
  end




end
