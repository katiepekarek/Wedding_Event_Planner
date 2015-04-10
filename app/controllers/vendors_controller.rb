class VendorsController <ApplicationController
  before_action :set_user

  def index
    @vendors = Vendor.all
  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(vendor_params)
    if @vendor.save

      redirect_to vendor_path(@vendor)

    else
      render :new

    end
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def update
    @vendor = Vendor.find(params[:id])
    if @vendor.update(vendor_params)

      redirect_to vendor_path(vendor_params)

    else
      render :edit
    end
  end

  def destroy
    vendor = Vendor.find(params[:id])
    vendor.destroy

    redirect_to vendors_path
  end

  private

  def vendor_params
    params.require(:vendor).permit(:name, :phone_number, :contact_person, :contact_email, :additional_info)
  end

  def set_user
    @user = current_user
  end

end
