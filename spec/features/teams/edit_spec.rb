require 'rails_helper'

RSpec.describe 'Team edit' do
  it 'is able to update an existing team' do
    redbull = Team.create!(name: "Redbull", currently_leading: true, championships_won: 4, created_at: 15.seconds.ago)
    schumi = redbull.drivers.create!(name: "Michael Schumaker", up_for_hire: true, drivers_age: 19)
    albon = redbull.drivers.create!(name: "Alex Albon", up_for_hire: false, drivers_age: 20)

    visit "/teams/#{redbull.id}/edit"

    fill_in 'Name', with: 'Alpha Romeo'
    select 'false', from: 'Currently leading'
    fill_in 'Championships won', with: 0
    click_on 'Update Team'

    expect(current_path).to eq("/teams/#{redbull.id}")
    expect(page).to have_content('Alpha Romeo')
    expect(page).to have_content('false')
    expect(page).to have_content(0)
  end
end
