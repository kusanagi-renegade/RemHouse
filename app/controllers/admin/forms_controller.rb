class Admin::FormsController < ApplicationController
	before_action :authenticate_user!
	before_action :check_admin

	def index
		@forms = Form.all.order(updated_at: :desc)
	end

	def show
		@form = Form.find(params[:id])
	end

	def edit
		@form = Form.find(params[:id])
	end

	def update
		@form = Form.find(params[:id])

		@form.update(form_params_update)
		redirect_to admin_form_url(@form)
	end

	def destroy
		@form = Form.find(params[:id])

		@form.destroy
		redirect_to admin_index_path
	end

	private

		def form_params_update
			params.require(:form).permit(:email, :phone, :name, :variety, :other, :status)
		end

		def check_admin
			redirect_to ('/') unless current_user && current_user.admin?
		end

	end
