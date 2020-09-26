class ApplicationController < ActionController::API
  rescue_from Mongoid::Errors::DocumentNotFound, with: :record_not_found

  private

  def record_not_found
    render status: :not_found, json: { message: "Record not found" }
  end
end
