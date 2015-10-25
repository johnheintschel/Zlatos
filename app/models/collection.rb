class Collection
  include Mongoid::Document
  has_and_belongs_to_many :movies
  field :title, type: String
  field :slug, type: String
  validates :slug, presence: true
  def to_param
    slug
  end
end
