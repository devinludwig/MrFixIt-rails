class AddUserIdToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :user_id, :integer
    add_column :users, :username, :string
    add_column :workers, :username, :string
  end
end
