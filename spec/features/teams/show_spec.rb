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
end
