class HomeController < ApplicationController
        # before_action :authenticate_user!, except: [:index, :show]
         before_action :correct_user, only: [:edit, :update, :destroy ,:show]

        # instantiates new user
        def index
          @users = User.all
        end

        def show

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
        def edit
          @managers = User.where(role: "Manager")
        end

        def update
          @managers = User.where(role: "Manager")
          respond_to do |format|
            if @user.update(user_params)
              format.html { redirect_to root_path, notice: "Profile is successfully updated." }
              format.json { render :show, status: :ok, location: @user }
            else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @user.errors, status: :unprocessable_entity }
            end
          end
        end


        private
        def correct_user
          @user = User.find(params[:id])
        end


        def user_params
          # strong parameters
          params.require(:user).permit(:email, :password, :password_confirmation,:first_name,:last_name,:phone_number,:cnic,:role,:joining_date,:assigned_manager)
        end

end