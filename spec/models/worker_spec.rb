require 'rails_helper'

RSpec.describe Worker, type: :model do
  it do
    should have_many :users
    should have_many :jobs
    should validate_presence_of :email
  end
end
