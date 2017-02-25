class Job < ActiveRecord::Base
  validates :title, :presence => true
  belongs_to :worker, optional: true
  belongs_to :user, optional: true
end
