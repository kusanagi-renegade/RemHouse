class RegistrationsController < Devise::RegistrationsController
  skip_before_action :require_no_authentication, only: [:new]
  before_action :authenticate_user!
  before_action :check_admin

  def new
    super
  end

  def create
     @user = User.new(user_params)
    if @user.save
        redirect_to('/')
    else
        render 'new'
    end
  end

  def destroy
    super
  end

  def update
    super
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :fio, :repair, :construction)
    end

    def check_admin
      redirect_to ('/') unless current_user && current_user.admin?
    end

  end