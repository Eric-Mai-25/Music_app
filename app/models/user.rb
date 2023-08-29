class User < ApplicationRecord
    validates :email, presece: true, uniqueness: true
    validates :password_digest, presece: true
    validates :password, length: {minimum:6}, allow_nil: true
    attr_reader :password

    def self.finy_by_credentials

    end
    
    def generate_unique_session_token

    end


end
