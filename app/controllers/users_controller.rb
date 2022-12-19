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
        respond_to do |format|

            format.html

            format.js

        end
        if @user.save
                    redirect_to  bookings_path, notice: "Usuário foi criado com sucesso!"
                    #tire o método de comentário quando criar o helper.
                    #Usuário depois de cadastrar-se acessa o sistema automaticamente
            else
                render action: :new
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
