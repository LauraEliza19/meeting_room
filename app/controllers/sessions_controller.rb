class SessionsController < ApplicationController
    # before_action :block_access, except: [:destroy]
    def index
    end
  
    def create
      reset_session # destroi a sessão atual
  
      @user = AutenticaUsuarioUsando(params[:name], params[:password])
  
      if @user # se existir o usuario
        session[:user_id] = @user.id                                 # salva o id na session (usado anteriormente lembra?)
        redirect_to bookings_path, :notice => "Logado com sucesso" # direciona para a pagina inicial de um usuário logado
      else                                                          # caso nao exista o usuário exibe a mesma pagina mas com uma :notice de falha
        flash.now[:notice] = "Usuário ou Senha incorretos, tente novamente."
        render :new
      end
    end
  
    def destroy
      reset_session # destroi a sessão atual
      redirect_to login_path # direciona para o path de login
    end
end


