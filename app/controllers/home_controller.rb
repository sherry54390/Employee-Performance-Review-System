class HomeController < ApplicationController
        # before_action :authenticate_user!, except: [:index, :show]
        # before_action :correct_user, only: [:edit, :update, :destroy]

        # instantiates new user
        def index
          @users = User.all
          #@abc = User.find(params[:id])

          #@abc =  User.where(id: @lol).survey_forms[0].id
        end
        # .survey_forms[0].id
        # survey_form_path(id:@abc)

        def show
          @user = User.find(params[:id])
          # @user_survey = @user.survey_forms[0].id
          #   @question = SurveyForm.find(params[:@user_survey])
        end

        def new
          @managers = User.where(role: "Manager")

          @user = User.new
        end


        def create
          @user = User.new(user_params)
          if @user.save
            # stores saved user id in a session

            redirect_to root_path, notice: 'Successfully created account'
          else
            render :new
          end
        end


        private
        def user_params
          # strong parameters
          params.require(:user).permit(:email, :password, :password_confirmation,:first_name,:last_name,:phone_number,:cnic,:role,:joining_date,:assigned_manager)
        end

        #def role_hr
        # if current_user.role == "HR"

        # end


        #end
end