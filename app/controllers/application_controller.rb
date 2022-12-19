class ApplicationController < ActionController::Base
    # protect_from_forgery with: :exception
    # include SessionsHelper
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    # protect_from_forgery with: :exception
    include SessionsHelper
    # def new 
    #     respond_to do |format|
    #         format.html
    #         format.js
    #     end
    # end
    protect_from_forgery

# todos os metodos daqui em diante serão privados
private 

  def logged_in?
    current_user.present? # se esta presente, se tem valor
  end

  # current_user vai ser o usuario de acordo com o :user_id armazenado em sessão

  def current_user
    @current_user ||= session[:user_id] && User.find_by_id(session[:user_id])
  end

  def require_logged_user
    return if logged_in?

    redirect_to login_path, :notice => "É necessario estar logado para acessar"
  end

    
end
