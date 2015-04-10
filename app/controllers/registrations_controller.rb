class RegistrationsController<ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :email, :password, :password_confirmation, :bank_website))
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "You have successfully signed up"
      redirect_to root_path
    else
      render :new
    end
  end

end
