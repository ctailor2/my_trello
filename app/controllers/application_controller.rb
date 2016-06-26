class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate!

  private

  def authenticate!
    redirect_to login_path and return unless cookies[:token].present?
  end

  def regular_view
    @body_attrs = {}
    @view_container_attrs = {}
  end

  def angular_view(angular_controller)
    @body_attrs = { data: { no: { turbolink: 'true' } }, ng: { app: 'MyTrello' } }
    @view_container_attrs = { ng: { controller: angular_controller } }
  end
end
