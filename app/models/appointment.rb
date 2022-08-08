# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :counsellor, class_name: 'User'
  belongs_to :customer, class_name: 'User'
  validates :time, uniqueness: { message: 'Already Booked' }
end
