class User < ApplicationRecord
	before_save {self.name = name.downcase}
	validates :name, presence: true, length: { maximum: 16 },
									 uniqueness: { case_sensitive: false }
	has_secure_password

	validates :password, length: { minimum: 6 }
end
