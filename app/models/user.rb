class User < ApplicationRecord
    has_many :notes
    has_many :reminders
    has_secure_password

    validates :username, presence: true, uniqueness: true
    validates :password, presence: true
end
