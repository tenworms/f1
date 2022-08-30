require 'rails_helper'

RSpec.describe "Driver index page" do
  it "i see the name of each parent" do
    redbull = Team.create!(name: "Redbull", currently_leading: true, championships_won: 4)
    mclaren = Team.create!(name: "Mclaren", currently_leading: false, championships_won: 1)

    visit "/teams"

    expect(page).to have_content(redbull.name)
    expect(page).to have_content(mclaren.name)

  end

  it 'orders the index page by most recently created' do
    redbull = Team.create!(name: "Redbull", currently_leading: true, championships_won: 4, created_at: 15.seconds.ago)
    mclaren = Team.create!(name: "Mclaren", currently_leading: false, championships_won: 1, created_at: 10.seconds.ago)
    ferrari = Team.create!(name: "Ferrari", currently_leading: false, championships_won: 8, created_at: 5.seconds.ago)

    visit '/teams'


    expect("Ferrari").to appear_before("Mclaren")
    expect("Mclaren").to appear_before("Redbull")

  end

  it 'shows a link to create a new team' do

    visit '/teams'
    
    expect(page).to have_link('Create New Team')

    click_link 'Create New Team'

    expect(current_path).to eq('/teams/new')
  end


end
