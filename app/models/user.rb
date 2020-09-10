class User < ActiveRecord::Base
    has_secure_password
    has_many :inventories

    validates :username, uniqueness: true
end 
