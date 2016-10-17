require 'rails_helper'

describe ApiFlashcards::MainController do
  routes { ApiFlashcards::Engine.routes }

  it 'requires http auth' do
    get :index

    expect(response).to have_http_status(401)
  end

  it 'response 200' do
    request.env['HTTP_AUTHORIZATION'] =
      ActionController::HttpAuthentication::Basic.encode_credentials('zvlex', 'apitome1')

    get :index

    expect(response).to have_http_status(200)
  end
end
