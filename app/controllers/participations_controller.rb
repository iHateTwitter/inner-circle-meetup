class ParticipationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_participation, only: %I[show]

  # GET /participations
  # GET /participations.json
  def index
    @participations = current_user.participations
  end

  # GET /participations/1
  # GET /participations/1.json
  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participation
      @participation = Participation.find(params[:id])
    end
end
