# frozen_string_literal: true

class Service < ApplicationRecord
  belongs_to :counsellor, class_name: 'User'
  validates :service_name, uniqueness: { message: 'Already Exists' }
end
