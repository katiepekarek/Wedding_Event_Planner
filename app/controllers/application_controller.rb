class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    User.find_by(id: session[:user_id])
  end

  helper_method :current_user

  def authenticate
    unless current_user
      flash[:danger] = 'You must sign in'
      redirect_to signin_path
    end
  end

  def payments_sum
    @budget.payments.reduce(0) { |sum, payment| sum + (payment.paid ? payment.amount : 0) }
    # condition ? trueval : falseval
  end

  helper_method :payments_sum

  def budgets_sum
    current_user.budgets.reduce(0) { |sum, payment| sum + payment.total_due }
  end

  helper_method :budgets_sum

end
