class Project < ApplicationRecord
  include PgSearch::Model

  has_one_attached :photo

  PROJECT_TAGS = %w[Animation Branding Illustration Mobile Print Product-Design Typography Web-Design]
  belongs_to :user
  has_many :tests, dependent: :destroy
  validates :name, :description, :github_url, presence: true
  validates_inclusion_of :project_tag, in: PROJECT_TAGS

  pg_search_scope :search_project_name_description, against: %i[name description],
                  associated_against: {
                  user: [:username]
                  },
                  using: {
                  tsearch: { prefix: true }
                  }
end
