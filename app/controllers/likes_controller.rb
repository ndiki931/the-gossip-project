class LikesController < ApplicationController
	before_action :authenticate_user, only: [:destroy]

	def destroy

		puts "Salut, je suis dans le serveur"
    	@gossip_id = params[:id]
    	@gossip_nb_like = Gossip.find(@gossip_id).nb_like
    	@like = @gossip_nb_like +1

    	if Gossip.find(@gossip_id).update(nb_like: @like)
   			redirect_to gossips_path
   		end
    
  end

  private

  def authenticate_user
    unless current_user
      
      redirect_to new_session_path,  flash: {danger:"Please log in or create an account ."}
    end
  end
  
end


