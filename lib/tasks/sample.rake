namespace :sample do
  desc "TODO"
  task test: :environment do

    SurveyFormMailer.form_fill_notification.deliver_now
    puts 'Email Sent To All Employees'
  end

end
