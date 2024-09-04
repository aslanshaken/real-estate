class Api::V1::BuildingsController < ApplicationController
  before_action :set_building, only: [:update]

  def index
    @buildings = Building.includes(:client, :building_custom_fields).page(params[:page]).per(10)
    render json: {
      status: 'success',
      buildings: @buildings.map do |building|
        {
          id: building.id,
          client_name: building.client.name,
          address: building.address,
          state: building.state,
          zip: building.zip
        }.merge(
          building.building_custom_fields.each_with_object({}) do |bcf, hash|
            hash[bcf.custom_field.name.underscore] = bcf.value
          end
        )
      end
    }, status: :ok
  end

  def create
    @building = Building.new(building_params)
    if @building.save
      render json: { status: 'success', message: 'Building created successfully' }, status: :created
    else
      render json: { status: 'error', errors: @building.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @building.update(building_params)
      render json: { status: 'success', message: 'Building updated successfully' }, status: :ok
    else
      render json: { status: 'error', errors: @building.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_building
    @building = Building.find(params[:id])
  end

  def building_params
    params.require(:building).permit(:address, :state, :zip, custom_fields: {})
  end
end
