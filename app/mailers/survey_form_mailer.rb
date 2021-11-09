class SurveyFormMailer < ApplicationMailer
  default from: 'sr54390@gmail.com'

  def survey_form_submission_email
    @user = params[:user]
    @manager = User.find_by(id:@user.assigned_manager)
    mail(to: @manager.email, subject:"Form Submision")
    end
  def survey_form_to_hr
    @user = params[:user]
    @manager = User.find_by(id:@user.assigned_manager)
    @hr = User.find_by_role('HR')
    mail(to: @hr.email, subject:"Form Submision")
  end

  def form_fill_notification
    @recipients = User.where(role: 'Employee')
    emails = @recipients.collect(&:email).join(",")
    mail(to: emails, subject:"Fill Form")
  end
end

