class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy


  def spirits
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      UserMailer.account_activation(@user).deliver_now
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
    else
      render 'edit'
    end
  end

  private
  def user_params
  params.require(:user).permit(:name, :email, :password,
                               :card_number, :team_name,
                               :password_confirmation)

  end


# Confirms a logged-in user.
def logged_in_user
  unless logged_in?
    store_location
    flash[:danger] = "Please log in."
    redirect_to login_url
  end
end

# Confirms the correct user.
def correct_user
  @user = User.find(params[:id])
  redirect_to(root_url) unless @user == current_user
end

# Confirms an admin user.
def admin_user
  redirect_to(root_url) unless current_user.admin?
end

def submit
  flash[:notice] = "Post successfully created"
end

end
