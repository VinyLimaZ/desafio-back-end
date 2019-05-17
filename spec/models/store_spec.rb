require 'rails_helper'

RSpec.describe Store, type: :model do
  describe 'validation' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :owner_name }
  end
end
