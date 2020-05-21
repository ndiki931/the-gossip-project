
class SessionsController < ApplicationController

	def new
	end

  def index
    redirect_to new_session_path
  end

	def create
  # cherche s'il existe un utilisateur en base avec l’e-mail
  	@user = User.find_by(email: params[:email])

  	@check = @user && @user.authenticate(params[:password])

  # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
  	if @user && @user.authenticate(params[:password])
    	#session[:user_id] = user.id
    	log_in(@user)
      # on va cuisiner le cookie pour l'utilisateur
      if params[:accept] == "1" 
        remember_in(@user)
      end

      #puts User.all
    # redirige où tu veux, avec un flash ou pas
    	redirect_to gossips_path

  	else
      if !@user && !@check
    	 flash.now[:message] ="Un utilisateur avec cet email n'existe pas : please SignUp"
    	end
      if @user && !@check
    	 flash.now[:message] ="Invalid email/password combination . Try again !"
      end
    	render 'new'
  	end
	end

	def destroy
    if current_user && cookies.permanent[:user_id]
		  log_out(current_user)
    else 
      session.delete(:user_id)
    end
    redirect_to gossips_path
	end

end





