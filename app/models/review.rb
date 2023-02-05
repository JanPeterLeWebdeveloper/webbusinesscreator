class Review < ApplicationRecord
  belongs_to :user
  belongs_to :test

  QUESTION_1_CATEGORIES = %w[Great! Okay... Not\ so\ good...]

  validates_presence_of :rating, :question1
  validates_numericality_of :rating
  validates :question1, inclusion: { in: QUESTION_1_CATEGORIES }
end
