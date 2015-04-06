class PiSettingsController < ApplicationController
  before_action :set_pi_setting, only: [:show, :edit, :update, :destroy]

  # GET /pi_settings
  # GET /pi_settings.json
  def index
    @pi_settings = PiSetting.all
  end

  # GET /pi_settings/1
  # GET /pi_settings/1.json
  def show
  end

  # GET /pi_settings/new
  def new
    @pi_setting = PiSetting.new
  end

  # GET /pi_settings/1/edit
  def edit
  end

  # POST /pi_settings
  # POST /pi_settings.json
  def create
    @pi_setting = PiSetting.new(pi_setting_params)

    respond_to do |format|
      if @pi_setting.save
        format.html { redirect_to @pi_setting, notice: 'Pi setting was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pi_setting }
      else
        format.html { render action: 'new' }
        format.json { render json: @pi_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pi_settings/1
  # PATCH/PUT /pi_settings/1.json
  def update
    respond_to do |format|
      if @pi_setting.update(pi_setting_params)
        format.html { redirect_to @pi_setting, notice: 'Pi setting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pi_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pi_settings/1
  # DELETE /pi_settings/1.json
  def destroy
    @pi_setting.destroy
    respond_to do |format|
      format.html { redirect_to pi_settings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pi_setting
      @pi_setting = PiSetting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pi_setting_params
      params.require(:pi_setting).permit(:display, :capture, :album)
    end
end
