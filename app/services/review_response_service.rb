class ReviewResponseService
  attr_reader :card, :translation_result, :user_translation

  ZERO = 0

  def initialize(card, user_translation)
    @card = card
    @user_translation = user_translation
    @translation_result = CardTranslationService.new(card, user_translation).call
  end

  def check_distance
    translation_result.distance == ZERO
  end

  def generate_review_response
    if check_distance
      { message: I18n.t(:correct_translation_notice) }
    else
      {
        message: I18n.t(
          :translation_from_misprint_alert,
          user_translation: user_translation,
          original_text: card.original_text,
          translated_text: card.translated_text)
      }
    end
  end

  def call
    if translation_result.state
      generate_review_response
    else
      { message: I18n.t(:incorrect_translation_alert) }
    end
  end
end
