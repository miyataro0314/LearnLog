class CreateMeasurements < ActiveRecord::Migration[7.1]
  def change
    create_table :measurements do |t|
      t.date :date
      t.time :begin_at
      t.time :end_at
      t.integer :user_id
  
      t.timestamps
    end
  end
end
