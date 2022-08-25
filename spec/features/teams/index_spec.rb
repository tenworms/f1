require 'rails_helper'

RSpec.describe "Driver index page" do
  it "i see the name of each parent" do
    redbull = Team.create!(name: "Redbull", currently_leading: true, championships_won: 4)
    mclaren = Team.create!(name: "Mclaren", currently_leading: false, championships_won: 1)

    visit "/teams"

    expect(page).to have_content(redbull.name)
    expect(page).to have_content(mclaren.name)

  end
end
