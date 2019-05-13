class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :set_locale

   def set_locale
     I18n.locale = (session[:locale] || params[:locale] || extract_locale_from_accept_language_header).to_s.downcase.presence || I18n.default_locale
   end

  private


    def extract_locale_from_accept_language_header
      request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    end

    def user_not_authorized
      flash[:notice] = "You are not authorized to perform this action."
      redirect_to request.referrer
    end

end
