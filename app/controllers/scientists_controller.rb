class ScientistsController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :entry_not_found
rescue_from ActiveRecord::RecordInvalid, with: :entry_invalid


    def index
        render json: Scientist.all, status: :ok
    end

    def show
        scientist = find_scientist
        render json: scientist, serializer: ScientistPlanetDataSerializer, status: :ok
    end

    def create
        scientist = Scientist.create!(scientist_params)
        render json: scientist, status: :created
    end

    def update
        scientist = find_scientist
        scientist.update!(scientist_params)
        render json: scientist, status: :accepted
    end

    def destroy 
        scientist = find_scientist
        scientist.destroy
        render json: {}, status: :ok
    end

    private

    def find_scientist
        Scientist.find(params[:id])
    end

    def scientist_params
        params.permit(:name, :field_of_study, :avatar)
    end

    def entry_not_found
        render json: {error: "Scientist not found"}, status: :not_found
    end

    def entry_invalid(invalid)
        render json: {errors: ErrorMessageSerializer.error_messages(invalid.record.errors)}, status: :unprocessable_entity
    end


end
