class PinsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create update edit]
  before_action :pin, only: %i[ show edit update destroy ]
  impressionist :actions=>[:show,:index]
  # GET /pins or /pins.json
  def index
    @pins = Pin.all.with_attached_image.includes([:user,:categories])
    @q = params[:q]
    if @q
    titles = Arel::Table.new(:pins)[:title]
    @pins = @pins.where(titles.matches("%#{@q}%"))

    end
  end

  # GET /pins/1 or /pins/1.json
  def show
    @comments = pin.comments.includes(:user,:comments)
    impressionist(@pin)
  end

  # GET /pins/new
  def new
    @pin = Pin.new
  end

  # GET /pins/1/edit
  def edit
  end

  # POST /pins or /pins.json
  def create
    @pin = current_user.pins.build(pin_params)

    respond_to do |format|
      if @pin.save
        format.html { redirect_to pin_url(@pin), notice: "Pin was successfully created." }
        format.json { render :show, status: :created, location: @pin }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pins/1 or /pins/1.json
  def update
    respond_to do |format|
      if @pin.update(pin_params)
        format.html { redirect_to pin_url(@pin), notice: "Pin was successfully updated." }
        format.json { render :show, status: :ok, location: @pin }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pins/1 or /pins/1.json
  def destroy
    @pin.destroy

    respond_to do |format|
      format.html { redirect_to pins_url, notice: "Pin was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def pin
      @pin = Pin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pin_params
      params.require(:pin).permit(:title, :caption, :image, :user_id, :category_names)
    end
end
