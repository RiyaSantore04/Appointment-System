# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :counsellor, class_name: 'User',  foreign_key: 'counsellor_id'
  belongs_to :customer, class_name: 'User',foreign_key: 'customer_id'
end
