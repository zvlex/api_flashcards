class ErrorMessagesService
  attr_reader :errors

  def initialize(resource)
    @errors = ActiveModelSerializers::SerializableResource.new(resource, {
      serializer: ActiveModel::Serializer::ErrorSerializer,
    })
  end

  def call
    @errors.as_json
  end
end
