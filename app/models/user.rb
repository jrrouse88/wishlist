class User < ApplicationRecord
    has_secure_password
    has_many :comics, dependent: :destroy
    validates :email, :name, presence: true
    validates :email, uniqueness: true 
end
