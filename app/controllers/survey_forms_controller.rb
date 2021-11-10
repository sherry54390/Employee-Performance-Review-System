class SurveyFormsController < ApplicationController

  def new
    @question = SurveyForm.new
    #Condition For HR
    if current_user.role == "HR"
      @quest = SurveyForm.find(params[:id])
      user = User.find(@quest.user_id)
      @quest = SurveyForm.where(user_id: user.id, submitted_by: user.email).last
      ud = User.find(SurveyForm.find(params[:id]).user.assigned_manager).email
      @managerquestion = SurveyForm.find_by(submitted_by: ud, user_id: @quest.user_id)
      #Condition For Manager
    elsif current_user.role == "Manager"
      @quest = SurveyForm.find(params[:id])
      @quest = SurveyForm.find(params[:id])
      @question = SurveyForm.new
    end
  end

  def show
    @question = SurveyForm.find(params[:id])
    if current_user.role == "Manager"
      ud = User.find(SurveyForm.find(params[:id]).user.assigned_manager).email
      @managerquestion = SurveyForm.find_by(submitted_by: ud, user_id: @question.user_id)
    else
      ud = User.find(SurveyForm.find(params[:id]).user.assigned_manager).email
      @managerquestion = SurveyForm.find_by(submitted_by: ud, user_id: @question.user_id)
      #GETTING HR REMARKS LOGIC
      dd = "ahsan.hr@engin.tech"
      @hrRemarks = SurveyForm.find_by(submitted_by: dd, user_id: @question.user_id)
    end
  end

  def create
    @question = SurveyForm.new(survey_params)
    @user = User.find_by(id: survey_params[:user_id])
    if @question.save
      if current_user.role == "Employee"
        SurveyFormMailer.with(user: @user).survey_form_submission_email.deliver_now
      elsif SurveyFormMailer.with(user: @user).survey_form_to_hr.deliver_now
      end
      redirect_to root_path
    else
      render :new
    end
  end

  def fill_form
    @question = SurveyForm.find(params[:id])
  end

  private

  def survey_params
    params.require(:survey_forms).permit(:quality, :reliability, :job_knowledge, :attendence, :commitment, :creativity, :adherence_to_policy, :lead, :improvement_needed, :accomplishments, :user_id, :submitted_by, :remarks)
  end
end