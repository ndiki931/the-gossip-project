class Gossip < ApplicationRecord
	belongs_to :user

	#Gossip content should be mandatory
	validates :content, presence: true

	#gossip title should be mandatory and contains charcaters between 3 and 14
	validates :title,
		presence: true,
		length: {in: 3..14}

	#number of like should be integer
	validates :nb_like,
		numericality: { only_integer: true, greater_than_or_equal_to: 0, message: "cannot be negative"},
	 	allow_blank: true

end
