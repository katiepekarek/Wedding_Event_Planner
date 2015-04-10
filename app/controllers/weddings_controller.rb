class WeddingsController<ApplicationController

  def new
    @wedding = Wedding.new
  end

  def create
    @wedding = Wedding.new
    @wedding.user_id = current_user.id
    if @wedding.save(wedding_params)
      redirect_to wedding_path(@wedding)
    else
      render :new
    end
  end

  def show
    @wedding = Wedding.find(params[:id])
    @event = Event.new
    @events_by_day = @wedding.events.group_by { |event| event.date.strftime("%b %d %Y") }
  end

  private

  def wedding_params
    params.require(:wedding).permit(:user_id, :name)
  end


end
