class Country < ApplicationRecord
	belongs_to :short

	def country_name
		if name.present?
		    country = ISO3166::Country[name]
		    country.translations[I18n.locale.to_s] || country.name
		end
  	end
end
