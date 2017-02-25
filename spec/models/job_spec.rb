require 'rails_helper'

RSpec.describe Job, type: :model do
  it do
    should validate_presence_of :title
    should belong_to :user
    should belong_to :worker
  end
end
