# frozen_string_literal: true

class PopoverComponent < ViewComponent::Base
  def initialize(title:, content_text:)
    @title = title
    @content_text = content_text
  end
end
