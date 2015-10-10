class User
  include Mongoid::Document
  has_many :comments
  has_many :posts
  validates :first_name, :last_name, :username, :email, presence: true
  validates :username, uniqueness: {case_sensitive: false, message: 'That username is already taken.'}
  validates :email, uniqueness: {case_sensitive: false, message: 'That email is already taken.'}
  field :first_name, type: String
  field :last_name, type: String
  field :username, type: String
  field :email, type: String
end
