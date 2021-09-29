class LoginsController < ApplicationController
    # skip_before_action :require_login, only: [:new, :create]

    def index
    end

    def show
    end

    def new
        @login = Login.new
    end

    def create
        @login = Login.create(login_params)

        if @login.valid?
            session[:login_id] = @login.index
            redircet_to @login
        else
            flash[:error] = "Error- please try to create an account again."
            redircet_to new_login_path
    end

    private
        def login_params
            params.require(:login).permit(:email, :password)
        end
end
