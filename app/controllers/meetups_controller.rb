class MeetupsController < ApplicationController
  before_action :set_meetup, only: %I[show edit update destroy join]
  before_action :authenticate_user!, only: %I[new create edit update destroy]

  # GET /meetups
  # GET /meetups.json
  def index
    @meetups = Meetup.all.page(params[:page])
  end

  # GET /meetups/1
  # GET /meetups/1.json
  def show
  end

  # GET /meetups/new
  def new
    @meetup = Meetup.new
  end

  # GET /meetups/1/edit
  def edit
  end

  # POST /meetups
  # POST /meetups.json
  def create
    @meetup = Meetup.new(meetup_params)
    @meetup.host = current_user

    respond_to do |format|
      if @meetup.save
        format.html { redirect_to @meetup, notice: 'Meetup was successfully created.' }
        format.json { render :show, status: :created, location: @meetup }
      else
        Rails.logger.error @meetup.errors.to_json
        format.html { render :new }
        format.json { render json: @meetup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetups/1
  # PATCH/PUT /meetups/1.json
  def update
    return head :unauthorized_user unless @meetup.host == current_user

    respond_to do |format|
      if @meetup.update(meetup_params)
        format.html { redirect_to @meetup, notice: 'Meetup was successfully updated.' }
        format.json { render :show, status: :ok, location: @meetup }
      else
        format.html { render :edit }
        format.json { render json: @meetup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /meetups/1/join
  def join
    if @meetup.participants.ids.include? current_user.id
      flash[:notice] = "이미 참가신청한 모임 어쩌구"
      return redirect_to meetup_path(@meetup)
    end

    checker = AvoidanceChecker.new(current_user)
    joinable = checker.investigate(@meetup)
    if joinable
      @meetup.participants << current_user
      @meetup.save

      flash[:notice] = "참가신청 성공 어쩌구"
      redirect_to meetup_path(@meetup)
    else
      flash[:error] = "아무튼 참가안됨 어쩌구"
      redirect_to meetups_path
    end
  end

  # DELETE /meetups/1
  # DELETE /meetups/1.json
  def destroy
    @meetup.destroy
    respond_to do |format|
      format.html { redirect_to meetups_url, notice: 'Meetup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meetup
      @meetup = Meetup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def meetup_params
      params.require(:meetup).permit(:host_id, :title, :description, :url, :meetup_type, :participants_limit)
    end
end
