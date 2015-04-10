class PaymentsController<ApplicationController
  before_action :set_budget

  def create
    @payment = Payment.new(payment_params.merge(budget_id: params[:budget_id]))
    if @payment.save
      redirect_to vendor_budget_path(vendor_id:@budget.vendor_id, id:@budget.id)
    else
      redirect_to budgets_path(@budget)
    end
  end

  def edit
    @payment = Payment.find(params[:id])
  end

  def update
    @payment = Payment.find(params[:id])
    if @payment.update(payment_params)
      redirect_to vendor_budget_path(vendor_id: @budget.vendor_id, id:@budget.id)
    else
      render :edit
    end
  end

  def destroy
    Payment.find(params[:id]).destroy
    flash[:success] = 'Payment was successfully deleted'

    redirect_to vendor_budget_path(vendor_id: @budget.vendor_id, id:@budget.id)
  end

  private

  def set_budget
    @budget = Budget.find(params[:budget_id])
  end

  def payment_params
    params.require(:payment).permit(:budget_id, :due_date, :amount, :paid)
  end

end
