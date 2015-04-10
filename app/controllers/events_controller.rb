class EventsController<ApplicationController
  before_action :authenticate
  before_action :set_wedding

  def create
    @event = Event.new(event_params.merge(wedding_id: params[:wedding_id]))
    if @event.save(event_params)
      redirect_to wedding_path(@wedding)
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to wedding_path(@wedding)
    else
      render :edit
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    redirect_to wedding_path(@wedding)
    flash[:success] = "Event was successfully deleted"
  end

  private

  def event_params
    params.require(:event).permit(:location, :date, :start_time, :notes, :wedding_id, :vendor_id, :name)
  end

  def set_wedding
    @wedding = Wedding.find(params[:wedding_id])
  end
end
