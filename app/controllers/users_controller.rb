class UsersController < ApplicationController
	def show
		puts "Hello je suis le serveur"
    	@potin_id = params[:gossip_id]
    	@user_id = params[:id]
    	puts params
	end

	def new
	end

	def create
		puts "Salut, je suis dans le serveur"
    puts params[:accept]
   	@user = User.new(first_name: "#{params[:first_name]}", last_name: "#{params[:last_name]}",
    	email: "#{params[:email]}", email_confirmation: "#{params[:email_confirmation]}",
    	password: "#{params[:password]}", password_confirmation: "#{params[:password_confirmation]}")
    
    
   	if @user.save
      if params[:accept] =="1"
        remember_in(@user)
      else
        forget(@user)
      end
    	redirect_to new_session_path
   	else 
     render 'new'
   	end
	end

  def index
    redirect_to new_user_path
  end


end




