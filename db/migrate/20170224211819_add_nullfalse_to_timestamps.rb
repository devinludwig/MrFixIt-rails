class AddNullfalseToTimestamps < ActiveRecord::Migration[5.0]
  def change
    remove_column(:jobs, :created_at, :datetime)
    remove_column(:jobs, :updated_at, :datetime)
  end
end
