class Meeting < ApplicationRecord
    belongs_to :user
    # def Index
    #     start_time = params.fetch(:start_time, Date.today).to_date
    #     @meetings = Meeting.where(starts_at: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    # end 
end
