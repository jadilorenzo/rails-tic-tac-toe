class UsersController < ApplicationController
  def index
    @users = User.all
    @id = session['id']
    @user = {active: false}
    if @id
      @user = User.find @id
    end
    @logged_in = (@id != nil) & @user['active']
    puts @logged_in, @user['active']
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
    @user = User.new(user_params, active: true)

    if @user.save
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
    @user = User.find_by(user_params)

    if (@user)
      @user.update(active: true)
      session.update(id: @user.id)
      redirect_to action: 'index'
    else
      redirect_to action: 'login'
    end
  end

  def logout
    @user = User.find(params[:id])

    if (@user)
      @user.update(active: false)
      redirect_to action: 'index'
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
