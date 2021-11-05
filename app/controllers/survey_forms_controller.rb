class SurveyFormsController < ApplicationController


  def new




      @question= SurveyForm.new

    if current_user.role == "HR"
      @quest = SurveyForm.find(params[:id])
      user = User.find(@quest.user_id)

      @quest = SurveyForm.where(user_id: user.id,submitted_by: user.email).last

      ud = User.find(SurveyForm.find(params[:id]).user.assigned_manager).email
      @managerquestion = SurveyForm.find_by(submitted_by: ud, user_id: @quest.user_id)


    elsif current_user.role == "Manager"
      @quest = SurveyForm.find(params[:id])
            @quest = SurveyForm.find(params[:id])
            @question= SurveyForm.new




    end
  end

  def show

    @question = SurveyForm.find(params[:id])
    if current_user.role == "Manager"

      ud = User.find(SurveyForm.find(params[:id]).user.assigned_manager).email
      @managerquestion = SurveyForm.find_by(submitted_by: ud, user_id: @question.user_id)




    elsif current_user.role == "HR"
      ud = User.find(SurveyForm.find(params[:id]).user.assigned_manager).email
      @managerquestion = SurveyForm.find_by(submitted_by: ud, user_id: @question.user_id)

      #GETTING HR REMARKS LOGIC
      dd = SurveyForm.find(params[:id]).submitted_by
      @hrRemarks = SurveyForm.find_by(submitted_by: dd, user_id: @question.user_id)

    end
  end

  def create
    @question = SurveyForm.new(survey_params)

    if @question.save
     redirect_to  root_path
    else
     render :new
     end

    # respond_to do |format|
    #   if @question.save
    #     format.html { redirect_to @question, notice: 'Subscriber was successfully created.' }
    #     format.json { render :show, status: :created, location: @question }
    #
    #   else
    #
    #     format.html { render :new }
    #     format.json { render json: @question.errors, status: :unprocessable_entity }
    #   end
    #
    # end

  end

  def fill_form
    @question = SurveyForm.find(params[:id])
  end


  private
  def survey_params
    params.require(:survey_forms).permit(:quality,:reliability,:job_knowledge,:attendence,:commitment,:creativity,:adherence_to_policy,:lead,:improvement_needed,:accomplishments,:user_id,:submitted_by,:remarks)
  end
end