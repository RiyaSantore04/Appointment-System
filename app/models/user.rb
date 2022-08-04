# frozen_string_literal: true

class User < ApplicationRecord
  has_many :services, class_name: 'Service', foreign_key: 'counsellor_id'
  has_many :appointments, class_name: 'Appointment', foreign_key: 'counsellor_id', foreign_key: 'customer_id'
  enum user_type: {
    counsellor: '0',
    customer: '1'
  }
  validates :email, uniqueness: { message: ' Already Exists' }
end
