class User < ApplicationRecord
	has_secure_password
	has_many :gossips

	
	#user email should be mandatory, unique and valid
	validates :email,
	 confirmation: true,
	 presence: true,
	 uniqueness: true,
	 format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "the email adress is not valid email" }
	
	#user phone number should be mandatory and valid french number 
	validates :phone_number,
		format: { with: /\A(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})\z/, message: "is not a valid french phone number" },
		allow_blank: true
	#user password account should be mandatory, unique and minimum 6 characters
	validates :password,
		presence: true,
	 	length: { minimum: 6},
	 	allow_blank: true

	#user description should contain maximum 500 charcaters
	validates :bio,
	 	length: { maximum: 500},
	 	allow_blank: true
	#user age should be strictly positive
	validates :age,
	 	numericality: { only_integer: true, greater_than_or_equal_to: 0, message: "please enter a number greater than 0"},
	 	allow_blank: true

	#user first name and last name should be mandatory
	validates :first_name, presence: true
	validates :last_name, presence: true


	def remember(remember_token)
    	remember_digest = BCrypt::Password.create(remember_token)
    	self.update(remember_digest: remember_digest)
    	if self.save
    		puts self.remember_digest
    	else
    		puts self.errors.messages
    	end
  	end
end

