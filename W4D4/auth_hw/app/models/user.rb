class User < ApplicationRecord
  attr_reader :password
  validates :username, :session_token, presence: true, uniqueness:true
  validates :password_digest, presence: { message: 'Password can\'t be blank' }
  validates :password, length: { minimum: 8, allow_nil: true }
  before_validation :ensure_session_token


  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def self.find_by_credentials2(username, password)
    user = User.find_by(username: username)
    # the logic below doesn't work because password_digest
    # at this point is a string, not a Bcrypt::Password object.
    # so the == method is just using string == method

    # return user if user && user.password_digest == password

    # The below would work fine just as the regular method
    return user if user && BCrypt::Password.new(user.password_digest) == password
    nil
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return user if user && BCrypt::Password.new(user.password_digest).is_password?(password)
    nil
  end
  def password=(pw)
    @password = pw
    # this seems to automatically convert to a string when putting it into
    # password_digest
    self.password_digest = BCrypt::Password.create(pw)
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end
end
