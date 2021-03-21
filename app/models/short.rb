class Short < ApplicationRecord
	has_many :countries, dependent: :destroy
end
