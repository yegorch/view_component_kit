class PopoverComponent < ViewComponent::Base
  def initialize(title, content)
    @title = title
    @content = content
  end

  def render
    render "popover_component"
  end
end
