class BanketsController < ApplicationController
  before_action :set_banket, only: [:show, :edit, :update, :destroy]

  # GET /bankets
  # GET /bankets.json
  def index
    @bankets = Banket.all
  end

  # GET /bankets/1
  # GET /bankets/1.json
  def show
  end

  # GET /bankets/new
  def new
    @banket = Banket.new
  end

  # GET /bankets/1/edit
  def edit
  end

  # POST /bankets
  # POST /bankets.json
  def create
    @banket = Banket.new(banket_params)

    respond_to do |format|
      if @banket.save
        format.html { redirect_to @banket, notice: 'Banket was successfully created.' }
        format.json { render :show, status: :created, location: @banket }
      else
        format.html { render :new }
        format.json { render json: @banket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bankets/1
  # PATCH/PUT /bankets/1.json
  def update
    respond_to do |format|
      if @banket.update(banket_params)
        format.html { redirect_to @banket, notice: 'Banket was successfully updated.' }
        format.json { render :show, status: :ok, location: @banket }
      else
        format.html { render :edit }
        format.json { render json: @banket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bankets/1
  # DELETE /bankets/1.json
  def destroy
    @banket.destroy
    respond_to do |format|
      format.html { redirect_to bankets_url, notice: 'Banket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_banket
      @banket = Banket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def banket_params
      params.require(:banket).permit(:arrival, :departure, :places, :price, :post_id)
    end
end
