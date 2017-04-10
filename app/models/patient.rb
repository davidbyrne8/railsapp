class Patient < ActiveRecord::Base
has_many :requests

	def self.search(search_for)
		Patient.where("name = ?", search_for)
	end
end
