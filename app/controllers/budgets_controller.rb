class BudgetsController<ApplicationController
  before_action :set_user
  before_action :set_vendor, except: [:index]

  def index
    @budgets = Budget.all
  end

  def new
    @budget = Budget.new
  end

  def create
    @budget = Budget.new(budget_params.merge(vendor_id: params[:vendor_id]))
    @budget.user_id = current_user.id
    if @budget.save(budget_params)
      redirect_to vendor_budget_path(@vendor, @budget)
    else
      render :new
    end
  end

  def show
    @budget = Budget.find(params[:id])
    @payment = Payment.new
  end

  def edit
    @budget = Budget.find(params[:id])
  end

  def update
    @budget = Budget.find(params[:vendor_id])
    if @budget.update(budget_params)
      redirect_to vendor_budgets_path
      flash[:success] = "#{@vendor.name} budget was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    Budget.find(params[:id]).destroy
    flash[:success] = "#{@vendor.name}'s quote was successfully deleted."
    redirect_to budgets_path
  end

  private

  def set_vendor
    @vendor = Vendor.find_by(id: params[:vendor_id])
  end

  def set_user
    @user = current_user
  end

  def budget_params
    params.require(:budget).permit(:vendor_id, :total_due, :down_payment, :additional_payments, :user_id, :bank_website)
  end

end
