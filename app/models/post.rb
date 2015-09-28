class Post
  include Mongoid::Document
  belongs_to :user
  has_many :comments

  validates :title,  :presence => true
  validates :text, :presence => true, :length => { :minimum => 5 }
  
  field :title, type: String
  field :text, type: String
  field :score, type: Integer
end
