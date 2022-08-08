# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :counsellor, class_name: 'User'
  belongs_to :customer, class_name: 'User'
  validates :time, uniqueness: { message: 'Already Booked' }
  after_create :set_valid_to

  private

  def set_valid_to
    validate = 10.minutes.times
  end
end


