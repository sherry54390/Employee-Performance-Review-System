ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  #Uncomment all parameters which should be permitted for assignment

   permit_params :first_name, :last_name, :email, :phone_number, :cnic, :role, :joining_date, :password, :assigned_manager
  #
  # or
  #
  # permit_params do
  #  permitted = [:first_name, :last_name, :email, :phone_number, :cnic, :role, :joining_date, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :assigned_manager]
  #  permitted << :other if params[:action] == 'create' && current_user.admin?
  #  permitted
  # end
  
end
