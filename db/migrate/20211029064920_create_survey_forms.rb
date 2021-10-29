class CreateSurveyForms < ActiveRecord::Migration[6.1]
  def change
    create_table :survey_forms do |t|
      t.string :remarks
      t.string :submitted_by
      t.references :user, index: true

      t.timestamps
    end
  end
end
