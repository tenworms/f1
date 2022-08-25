require 'rails_helper'

RSpec.describe Team do

  it {should have_many :drivers}

  it { should validate_presence_of (:name)}
  it { should validate_presence_of (:championships_won)}
  it { should allow_value(true).for(:currently_leading)}
  it { should allow_value(false).for(:currently_leading)}

end
