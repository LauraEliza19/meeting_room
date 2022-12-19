class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

#   before_action :set_time_zone, if: :user_signed_in?

  
end
