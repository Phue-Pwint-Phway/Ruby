class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def index
    @users = User.all
    
    if params[:search_by_name] && params[:search_by_name] != ""
      @users = @users.where("name LIKE ?",
      "%#{params[:search_by_name]}%")
    end

    if params[:search_by_email] && params[:search_by_email] != ""
      @users = @users.where("email LIKE ?",
      "%#{params[:search_by_email]}%")
    end

    if params[:search_by_created_at] && params[:search_by_created_at] != ""
      @users = @users.where("created_at LIKE ?",
      "%#{params[:search_by_created_at]}%")
    end

    if params[:search_by_updated_at] && params[:search_by_updated_at] != ""
      @users = @users.where("updated_at LIKE ?",
      "%#{params[:search_by_updated_at]}%")
    end

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
    @user.updated_user_id = current_user.id

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
    @user.deleted_user_id = current_user.id
    @user.deleted_at = Time.now

    @user.soft_destroy
    
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
