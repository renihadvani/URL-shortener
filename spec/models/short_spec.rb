# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Short, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:countries) }
  end
end
