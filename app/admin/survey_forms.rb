ActiveAdmin.register SurveyForm do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :remarks, :submitted_by, :user_id, :quality, :reliability, :job_knowledge, :attendence, :commitment, :creativity, :adherence_to_policy, :lead, :improvement_needed, :accomplishments, :total
  #
  # or
  #
  # permit_params do
  #   permitted = [:remarks, :submitted_by, :user_id, :quality, :reliability, :job_knowledge, :attendence, :commitment, :creativity, :adherence_to_policy, :lead, :improvement_needed, :accomplishments, :total]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
