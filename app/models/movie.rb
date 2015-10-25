class Movie
  include Mongoid::Document
  belongs_to :user
  has_and_belongs_to_many :collections
  field :title, type: String
  field :slug, type: String
  validates :slug, presence: true
  def to_param
    slug
  end
end
