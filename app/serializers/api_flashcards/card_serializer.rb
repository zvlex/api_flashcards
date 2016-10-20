module ApiFlashcards
  class CardSerializer < ActiveModel::Serializer
    attributes :id, :original_text, :translated_text, :review_date,
      :user_id, :block_id, :interval, :repeat, :efactor, :attempt,
      :quality, :image, :created_at, :updated_at
  end
end
