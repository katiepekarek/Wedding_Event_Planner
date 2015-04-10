class EventsController<ApplicationController
  before_action :set_wedding

  def create
    @event = Event.new(event_params.merge(wedding_id: params[:wedding_id]))
    if @event.save(event_params)
      redirect_to wedding_path(@wedding)
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:location, :date, :start_time, :notes, :wedding_id, :vendor_id, :name)
  end

  def set_wedding
    @wedding = Wedding.find(params[:wedding_id])
  end
end
