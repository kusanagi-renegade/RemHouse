class Repair::FormsController < ApplicationController
	before_action :authenticate_user!
	before_action :check_repair

	def index
		@forms = Form.where("variety = 'ремонт и отделка'").order(updated_at: :desc)
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
		redirect_to repair_form_url(@form)
	end

	def destroy
		@form = Form.find(params[:id])

		@form.destroy
		redirect_to repair_index_path
	end

	private

		def form_params_update
			params.require(:form).permit(:email, :phone, :name, :variety, :other, :status)
		end

		def check_repair
			redirect_to ('/') unless current_user && current_user.repair?
		end

	end
