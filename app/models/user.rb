class User < ApplicationRecord
    has_secure_password
    has_many :comics
    validates :email, :name, presence: true
    validates :email, uniqueness: true 
end
