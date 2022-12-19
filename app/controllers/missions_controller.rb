class MissionsController < ApplicationController

rescue_from ActiveRecord::RecordInvalid, with: :entry_invalid

    def create
        mission = Mission.create!(mission_params)
        render json: mission.planet, status: :created
    end


    private

    def mission_params
        params.permit(:name, :scientist_id, :planet_id)
    end

    def entry_invalid(invalid)
        render json: {errors: ErrorMessageSerializer.error_messages(invalid.record.errors)}, status: :unprocessable_entity
    end

end
