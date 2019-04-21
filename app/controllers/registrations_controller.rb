class RegistrationsController < ApplicationController
	def new
		@user=User.new
	end

	def create
		@user = User.new(registration_params)
		if @user.save(registration_params)
	    	flash[:notice] = 'User was succesfully created'
			redirect_to 'http://localhost:3000/'
		else
			flash[:error] = 'Something went wrong'
			render :new
	  	end
	end

	private
		def registration_params
			params.require(:registrations).permit(:name, :lastname, :email , :phone, :password)
		end
end
