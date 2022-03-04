class Api::V1::BaseController < ApplicationController
  rescue_from(ActiveRecord::RecordNotFound) do |exception|
    response = { errors: [exception.message] }
    render_error(response, :not_found)
  end

  rescue_from(ActionController::ParameterMissing) do |parameter_missing_exception|
    error = {}
    error[parameter_missing_exception.param] = ['parameter is required']
    response = { errors: [error] }
    render_error(response, :unprocessable_entity)
  end

  private

  def render_error(response, status)
    render json: response, status: status
  end
end
