class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  
  before_save :encrypt_password

  has_many :posts
  has_many :comments
  has_secure_password
  validates :username, :email, presence: true
  validates :password, confirmation: true
  validates :username, uniqueness: {case_sensitive: false, message: 'That username is already taken.'}
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create } 
  validates :email, uniqueness: {message: 'That email is already taken.'}
  field :username, type: String
  field :email, type: String
  field :password_digest, type: String

  def encrypt_password
    if password.present?
      self.password_digest = BCrypt::Password.create(password, :cost => 10)
    end
  end
end
