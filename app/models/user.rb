class User
  include Mongoid::Document
  
  has_many :posts
  has_many :comments
  validates :first_name, :last_name, :username, :email, presence: true
  validates :username, uniqueness: {case_sensitive: false, message: 'That username is already taken.'}
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create } 
  validates :email, uniqueness: {case_sensitive: false, message: 'That email is already taken.'}
  field :first_name, type: String
  field :last_name, type: String
  field :username, type: String
  field :email, type: String
end
