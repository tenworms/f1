require 'rails_helper'

RSpec.describe Driver do
  describe "validations" do
    it {should belong_to :team}
    it {should validate_presence_of (:drivers_age)}
    it {should allow_value(true).for(:up_for_hire)}
    it {should allow_value(false).for(:up_for_hire)}

end
end
