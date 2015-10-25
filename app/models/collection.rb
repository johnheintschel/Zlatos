class Collection
  include Mongoid::Document
  has_and_belongs_to_many :movies
  field :title, type: String
end
