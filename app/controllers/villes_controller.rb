class VillesController < ApplicationController
	def show
		puts "Hello je suis le serveur"
    	@potin_id = params[:gossip_id]
    	@user_id = params[:user_id]
    	@ville_id = params[:id]
    	puts params
	end

end

