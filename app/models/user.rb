class User
  include Mongoid::Document

  has_many :comments
  has_many :posts
  
  field :first_name, type: String
  field :last_name, type: String
  field :username, type: String
  field :email, type: String
end
