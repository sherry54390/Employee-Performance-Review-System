class SurveyForm < ApplicationRecord
  belongs_to :user
  has_many :questions
end