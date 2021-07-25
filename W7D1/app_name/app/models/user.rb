class User < ApplicationRecord
    validates :username, presence: true
    validates :password_digest, presence: {message: 'Password cannot be blank'}
    validates :session_token, presence: true
    validates :password, length: { minimum: 8, allow_nil: true }
    before_validation :ensure_session_token

    attr_reader :password

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        return nil if user.nil?
        user.is_password?(password) ? user : nil
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64(16)
    end

    def reset_session_token!
        self.session_token = User.generate_session_token
        self.save!
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password(password)
        BCrypt::Password.new(password) == self.password_digest
    end
end
