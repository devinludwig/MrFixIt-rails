class AddTimestampsToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column(:jobs, :created_at, :datetime)
    add_column(:jobs, :updated_at, :datetime)
  end
end
