class Service < ApplicationRecord
	belongs_to :counsellor, class_name: "User"
end

