class Feedback < ApplicationRecord
  belongs_to :counsellor, class_name: 'User'
  belongs_to :customer, class_name: 'User'
end
