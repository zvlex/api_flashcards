module ApiFlashcards
  class ApplicationController < ActionController::API
    before_action do
      if params[:private_token]
        @api_user = User.find_by(token: params[:private_token])
      end

      unless @api_user
        render json: { message: I18n.t(:unauthorized_status) }, status: 401
      end
    end
  end
end
