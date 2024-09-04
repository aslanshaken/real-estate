class Api::V1::BuildingsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update]
  before_action :set_building, only: [:update]

  def index
    page = params[:page] || 1
    per_page = params[:per_page] || 10
    @buildings = Building.includes(:client, :building_custom_fields)
                         .page(page)
                         .per(per_page)

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
            if bcf.custom_field
              hash[bcf.custom_field.name.parameterize.underscore] = bcf.value
            end
          end
        )
      end
    }, status: :ok
  end

  def create
    @building = Building.new(building_params.except(:custom_fields))

    if @building.save
      if handle_custom_fields(@building, building_params[:custom_fields])
        render json: { status: 'success', message: 'Building created successfully' }, status: :created
      else
        @building.destroy
        render json: { status: 'error', message: 'Invalid custom fields' }, status: :unprocessable_entity
      end
    else
      render json: { status: 'error', errors: @building.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @building.update(building_params.except(:custom_fields))
      if handle_custom_fields(@building, building_params[:custom_fields])
        render json: { status: 'success', message: 'Building updated successfully' }, status: :ok
      else
        render json: { status: 'error', message: 'Invalid custom fields' }, status: :unprocessable_entity
      end
    else
      render json: { status: 'error', errors: @building.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_building
    @building = Building.find(params[:id])
  end

  def building_params
    params.require(:building).permit(:address, :state, :zip, :client_id, custom_fields: {})
  end

  def handle_custom_fields(building, custom_fields)
    custom_fields.each do |name, value|
      formatted_name = format_custom_field_name(name)
      custom_field = CustomField.find_or_create_by(name: formatted_name, client_id: building.client_id) do |cf|
        cf.field_type = determine_field_type(value)
      end
      bc_field = BuildingCustomField.find_by(building: building, custom_field: custom_field)
      if bc_field
        bc_field.update!(value: value)
      else
        BuildingCustomField.create!(building: building, custom_field: custom_field, value: value)
      end
    end
  end

  def format_custom_field_name(name)
    name.split('_').map(&:capitalize).join(' ')
  end

  def determine_field_type(value)
    if value.is_a?(Numeric)
      'number'
    elsif value.is_a?(String)
      'freeform'
    else
      'text'
    end
  end
end
