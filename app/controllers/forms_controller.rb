class FormsController < ApplicationController

	def new
	end

	def create
		@form = Form.create(form_params)

		@form.save
		redirect_to '/'
	end

	private
	def form_params
		params.require(:form).permit(:email, :phone, :name, :variety, :other)
	end

	end
