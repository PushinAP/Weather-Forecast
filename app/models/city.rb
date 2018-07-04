class City < ApplicationRecord
	validates :city_name, presence:true
	validates :city_id, presence:true, uniqueness:true
end
