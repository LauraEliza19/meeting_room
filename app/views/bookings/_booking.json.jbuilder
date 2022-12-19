json.extract! booking, :id, :description, :start_time, :end_time, :star_date, :created_at, :updated_at
json.url booking_url(booking, format: :json)
