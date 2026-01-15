    # app/controllers/api/v1/visits_controller.rb
    # class VisitsController < ApplicationController
    # module Api
    #  module V1
    class VisitsController < ApplicationController
      before_action :authenticate_user!  # si usas Devise + JWT
      before_action :set_visit, only: %i[show update destroy sync_to_redmine]

      def index
        @visits = policy_scope(Visit).includes(:vehicle, :user).order(occurred_at: :desc)
        render json: VisitSerializer.new(@visits).serializable_hash
      end

      def show
        authorize @visit
        render json: VisitSerializer.new(@visit).serializable_hash
      end

      def create
        @visit = Visit.new(visit_params)
        @visit.user = current_user if current_user
        authorize @visit
        if @visit.save
          render json: VisitSerializer.new(@visit).serializable_hash, status: :created
        else
          render json: { errors: @visit.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        authorize @visit
        if @visit.update(visit_params)
          render json: VisitSerializer.new(@visit).serializable_hash
        else
          render json: { errors: @visit.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        authorize @visit
        @visit.destroy
        head :no_content
      end

      private

      def set_visit
        @visit = Visit.find(params[:id])
      end

      def visit_params
        params.require(:visit).permit(:vehicle_id, :occurred_at, :reason, :km, :notes, :status, attachments: [])
      end
    end
#  end
# end
