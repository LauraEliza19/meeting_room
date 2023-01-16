class SessionsController < ApplicationController
    # before_action :block_access, except: [:destroy]

    def index
    end
    
    def create
        # user = User.authenticate_by(name: params[:user][:name], password: params[:user][:password])
    
        user = User.find_by(name: params[:session][:name])
        if user && user.authenticate(params[:session][:password])
          session[:user_id] = user.id
          flash[:notice] = " #{user.name} logado com sucesso!"
          redirect_to bookings_path
        else
          flash.now[:alert] = "Dados incorretos de login."
          render 'new'
        end
    end
       
      def destroy
        session[:user_id] = nil
        flash[:notice] = "Você saiu."
        redirect_to root_path
      end

    # def user_params
    #     params.require(:user).permit(:name, :email, :password, :password_confirmation)
    # end
end


