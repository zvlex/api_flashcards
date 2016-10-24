module ApiFlashcards
  module Api::V1
    class CardsController < ApplicationController
      # @example GET
      #   # All cards
      #   http://localhost:3000/api_flashcards/api/v1/cards
      #
      #   # Limited cards on page
      #   http://localhost:3000/api_flashcards/api/v1/cards?page=1
      #
      # @param page [Integer] Current page number
      # @return [Array] List of cards
      def index
        @cards = @api_user.cards.page(params[:page]).per(PER_PAGE)

        render json: @cards, each_serializer: CardSerializer
      end

      # @return [Hash] Card or empty hash
      def show
        @card = @api_user.cards.find_by(id: params[:id])

        if @card
          render json: @card, serializer: CardSerializer
        else
          render json: { data: Hash.new }
        end
      end

      # @example POST
      #   http://localhost:3000/api_flashcards/api/v1/cards?original_text=hello&translated_text=привет&block_id=1&remote_image_url=URL
      # @param original_text [String]
      # @param translated_text [String]
      # @param remote_image_url [String]
      # @param block_id [Integer]
      # @return [Hash] Created card or errors hash
      # @version 1.0
      def create
        @card = @api_user.cards.build(card_params)

        if @card.save
          render json: @card, serializer: CardSerializer
        else
          render json: ErrorMessagesService.new(@card).call, status: 422
        end
      end

      # @example GET
      #   http://localhost:3000/api_flashcards/api/v1/cards/review?card_id=4&user_translation=любовь
      # @param card_id [Integer] Current card id
      # @param user_translation [String] User translation
      # @return [Hash] Checked translation status message
      def review
        @card = @api_user.cards.find_by(id: card_review_params[:card_id])

        render json: ReviewResponseService.new(@card, card_review_params[:user_translation]).call
      end

      private

      def card_params
        params.permit(:original_text, :translated_text, :remote_image_url, :block_id)
      end

      def card_review_params
        params.permit(:card_id, :user_translation)
      end
    end
  end
end
