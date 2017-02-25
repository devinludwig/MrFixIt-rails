require 'rails_helper'

RSpec.describe User, type: :model do
  it do
    should have_many :workers
    should have_many :jobs
    should validate_presence_of :email
  end
end
