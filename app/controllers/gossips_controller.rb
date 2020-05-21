class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new, :edit, :destroy]

  def index
  end

  def new
    
  # on code quelque chose qui permet d'afficher le dashboard de l'utilisateur
    
  end

  def create
    #binding.pry
    puts "Salut, je suis dans le serveur"
    @gossip = Gossip.new(user: current_user, content: "#{params[:content]}", title: "#{params[:title]}", nb_like: 0)
    if @gossip.save
     redirect_to gossips_path,  flash: {success:"Ton potin a été bien créé !"}
    else 
      render 'new'
    end
  end

  def edit
    puts "Salut, je suis dans le serveur"
    @potin_id = params[:id]
    @gossip = Gossip.find(@potin_id)
    puts params
  end

  def update
    puts "Salut, je suis dans le serveur"
    @potin_id = params[:id]
    @gossip = Gossip.find(@potin_id)
    if @gossip.update(params.permit(:title, :content))
      redirect_to gossips_path,  flash: {success:"Ton potin a été modifié !"}
    else
      render 'edit'
    end
  end

  def destroy
    puts "Salut, je suis dans le serveur"
    @potin_id = params[:id]
    @gossip = Gossip.find(@potin_id)
    if @gossip.destroy
      redirect_to gossips_path
    end
  end


  def show
    puts "Hello je suis le serveur"
    @potin_id = params[:id]
    puts params
  end

  def details_gossips_user
    puts "Hello je suis le serveur"
    @user_id = params[:user_id]
    @potin_id = params[:gossip_id]
    puts params
  end

  private

  def authenticate_user
    unless current_user
      
      redirect_to new_session_path,  flash: {danger:"Please log in or create an account ."}
    end
  end


end










