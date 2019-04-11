require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
      it {should have_many :reviews}
  end

end
