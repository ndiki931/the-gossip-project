class ApplicationController < ActionController::Base
	#We can add this authenticity token to our session with one simple line, added to our application controller.
	# Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
end
