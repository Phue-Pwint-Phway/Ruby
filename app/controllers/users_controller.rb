class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    @user.create_user_id = current_user.id

    if @user.save
      redirect_to @user
    else
      render :new
    end

    # @user = User.create(user_params)
    # if @user.valid?
    #   session[:user_id] = @user.id
    #   redirect_to @user
    # else
    #   flash[:error] = "Error- please try to create an account again."
    #   redirect_to new_user_path
    # end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.updated_user_id = current_user.id

    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to root_path
  end

  # def search
  #   if params[:search].blank?
  #     redirect_to users_path and return
  #   else
  #     @parameter = params[:search].downcase
  #     @results = User.all.where("lower(name) LIKE :search", search: "%#{@parameter}%")
  #   end
  # end

  private
    def user_params
      params.require(:user)
      .permit(:name, :email, :password, :password_confirmation, :profile, :role, :phone, :address, :dob)
    end
end
