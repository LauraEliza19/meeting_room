class UsersController < ApplicationController

    def new
        @user = User.new
        respond_to do |format|
            format.html
            format.js
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
          flash[:notice] = "Usuário #{@user.name} Criado!"
          redirect_to sessions_new_path
        else
          render 'new'
        end
      end
      
     private
      
      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end
    def index
        @users = User.all
      end
    def show
        @user = User.find(params[:id])
    end
end
