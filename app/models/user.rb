class User < ApplicationRecord
    before_validation :ensure_session_token
    validates :email, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :password, length: {minimum:6}, allow_nil: true
    attr_reader :password

    def self.finy_by_credentials(email,password)
        @user = User.find_by(email: email)
        if @user && @user.is_password?(password)
            user
        else
            nil
        end

    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end

    def is_password?(password)
        pass_obj = BCrypt::Password.new(password)
        pass_obg.is_password?(password)
    end
    
    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save
        self.session_token
    end

    def generate_unique_session_token
        while true
            session_token = SecureRandom::urlsafe_base64
            return session_token unless User.exists?(session_token: session_token)
        end
    end

    def ensure_session_token
        self.session_token ||= generate_unique_session_token

    end

    


end
