class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @url = '/user'
    @submit_text = 'Sign Up'
  end

  def create
    @user = User.new(user_params)

    if @user.save
      puts true
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
    @url = '/user'
    @submit_text = 'Update User'
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def login
    @user = User.new
    @url = '/users/login_success'
    @submit_text = 'Login'
  end

  def login_success
    if (User.find_by(user_params))
      redirect_to action: 'index'
    else
      redirect_to action: 'login'
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
