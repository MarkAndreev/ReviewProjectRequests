class RequestsController < ApplicationController
  before_action :authenticate_admin!, :only => [:update, :edit]
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all
  end

  # GET /requests/1
  # GET /requests/1.json
  def show

  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)
    @admins = Admin.all

    respond_to do |format|
      if @request.save
        RequestMailer.with(request: @request).welcome_email.deliver_later

        if @request.email != ""
          @admins.each do |a|
            RequestMailer.with(request: @request, admin: a).new_request_email.deliver_late
          end
          format.html { redirect_to root_path, notice: 'Спасибо мы обязательно с вами свяжемся!' }
        else
          format.html { redirect_to root_path, notice: 'Спасибо за ваш отзыв!' }
        end
        #format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        #format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update

    respond_to do |format|
      if @request.update(request_params)
        RequestMailer.with(request: @request).response_email.deliver_later
        format.html { redirect_to admin_dashboard_path, notice: 'Отличная работа!' }
      else
        format.html { redirect_to admin_dashboard_path }
        #format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit!
    end
end
