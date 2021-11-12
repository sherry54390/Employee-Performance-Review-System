namespace :sample do
  desc "TODO"
  task test: :environment do

    SurveyFormMailer.form_fill_notification.deliver_now
    puts 'Email Sent To All Employees'



    # @users = User.where(role: "Employee")
    # @users.each do |user|
    #   @jdate = user.join_date
    #   jdate = @jdate.to_datetime
    #   cdate = Time.now()
    #   csec = cdate.to_i
    #   jsec = jdate.to_i
    #   jseconds = csec - jsec
    #   jmonths = jseconds/(60*60*24*30)
    #   form = SurveyForm.find_by(empname: user.fname, user_id: user.id)
    #   if form.present?
    #     @fdate = form.reviewdate
    #     fdate = @fdate.to_datetime
    #     fsec = fdate.to_i
    #     fseconds = csec - fsec
    #     fmonths = fseconds/(60*60*24*30)
    #     months = fmonths
    #   else
    #     months = jmonths
    #   end
    #   if months >= user.reviewduration
    #     UserMailer.submit_form(user).deliver
    #     user.status = "active"
    #   end
    #   end

end
  end