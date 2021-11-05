class SurveyAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :survey_answers do |t|
    t.text :answer
  end
  end
  end
