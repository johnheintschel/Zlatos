class Comment
  include Mongoid::Document
  belongs_to :post 
  belongs_to :user
  field :username, type: String
  field :text, type: String
  field :score, type: Integer

end
