require 'rails_helper'

RSpec.describe 'new team' do
  it 'can fill attributes and create new team' do
    visit '/teams'
    click_link 'Create New Team'

    expect(current_path).to eq('/teams/new')

    fill_in 'Name', with: 'Alpha Romeo'
    select 'false', from: 'Currently leading'
    fill_in 'Championships won', with: 0
    click_on 'Create New Team'

    expect(current_path).to eq('/teams')
    expect(page).to have_content('Alpha Romeo')
    expect(page).to have_content('false')
    expect(page).to have_content(0)
  end

end
