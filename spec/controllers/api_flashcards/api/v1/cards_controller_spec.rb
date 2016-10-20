require 'rails_helper'

module ApiFlashcards
  module Api::V1
    describe CardsController do
      routes { ApiFlashcards::Engine.routes }

      describe 'no private_token' do
        before do
          get :index
        end

        it 'response 401 status' do
          expect(response).to have_http_status(401)
        end

        it 'returns json' do
          expect(response.content_type).to eq('application/json')
        end

        it 'returns Access denied! message' do
          api_response = JSON.parse(response.body)

          expect(api_response['message']).to eq(I18n.t('unauthorized_status'))
        end
      end
    end
  end
end
