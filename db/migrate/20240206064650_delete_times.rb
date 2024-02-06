class DeleteTimes < ActiveRecord::Migration[7.1]
  def change
    drop_table :times
  end
end
