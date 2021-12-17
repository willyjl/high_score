class ApplicationController < ActionController::API
  include Pagy::Backend
  
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  private

  def render_not_found
    render status: :not_found
  end
end
