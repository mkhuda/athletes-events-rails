class EmbedController < ApplicationController
  def index
    @index_name = "this is just index"
  end

  def eventstandings
  	@event = Event.find(params[:event_id])
    if @event.category == 'Individual'
      @fetch = Athleteevent.all.where("event_id = ?", params[:event_id])
    else
      @fetch = Teamevent.all.where("event_id = ?", params[:event_id])
    end
  end

  def eventresults
  	@event = Event.find(params[:event_id])
		
    if @event.category == 'Individual'
      @fetch = Athleteevent.all.where("event_id = ?", params[:event_id])
    else
      @fetch = Teamevent.all.where("event_id = ?", params[:event_id])
    end
  end

end
