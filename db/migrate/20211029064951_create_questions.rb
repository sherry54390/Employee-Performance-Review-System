class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :questions
      t.string :answers
      t.references :survey_forms, index: true

      t.timestamps
    end
  end
end
