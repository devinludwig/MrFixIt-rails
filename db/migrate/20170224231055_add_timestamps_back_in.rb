class AddTimestampsBackIn < ActiveRecord::Migration[5.0]
  def change
    change_table :jobs do |t|
      t.timestamps
    end
  end
end
