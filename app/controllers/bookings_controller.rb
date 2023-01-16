class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy ]
  
#   before_action :authenticate_user!, except: [:index, :show]
  # GET /bookings or /bookings.json
   def index
    @bookings = Booking.all
    @currentTime = Time.zone.now
  end

  # GET /bookings/1 or /bookings/1.json
  def show
    @currentTime = Time.zone.now
  end

  # GET /bookings/new
  def new        
        @booking = current_user.bookings.build
        # @booking = Booking.new
        @datePass = params[:star_date]
        @timePass = params[:start_time]
        @booking.star_date = @datePass
        @booking.start_time = @timePass
        @currentTime = Time.zone.now        
  end

  # GET /bookings/1/edit
  def edit
    @datePass = params[:star_date]
    @timePass = params[:start_time]
    @booking = Booking.find(params[:id])
  end

  # POST /bookings or /bookings.json
  def create
    # @booking.user_id=1
    # @booking = Booking.new(booking_params)
    @booking = current_user.bookings.build(booking_params)    
    respond_to do |format|
        if @booking.save
            format.html { redirect_to bookings_path, notice: "Reserva feita com sucesso!" }
        else
            format.html { render :index, status: :unprocessable_entity, notice:"Não foi possível realizar a reserva!" }
            format.json { render json: @booking.errors, status: :unprocessable_entity, notice:"Não foi possível realizar a reserva!" }
        end
      end
  end

  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @bookings, notice: "Reserva atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: "Reserva excluída com sucesso" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:description, :star_date, :start_time, :user.name)
    end
end
