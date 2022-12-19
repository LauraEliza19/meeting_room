class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.date :star_date
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
