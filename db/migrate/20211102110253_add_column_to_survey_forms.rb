class AddColumnToSurveyForms < ActiveRecord::Migration[6.1]
  def change
    add_column :survey_forms, :quality, :string
    add_column :survey_forms, :reliability, :string
    add_column :survey_forms, :job_knowledge, :string
    add_column :survey_forms, :attendence, :string
    add_column :survey_forms, :commitment, :string
    add_column :survey_forms, :creativity, :string
    add_column :survey_forms, :adherence_to_policy, :string
    add_column :survey_forms, :lead, :string
    add_column :survey_forms, :improvement_needed, :string
    add_column :survey_forms, :accomplishments, :string
    add_column :survey_forms, :total, :integer
  end
end
