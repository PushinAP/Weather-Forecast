class User < ApplicationRecord
	before_save {self.name = name.downcase}
	has_secure_password
end
