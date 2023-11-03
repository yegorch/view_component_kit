class TurboInlineEditorComponent < ApplicationComponent
  def initialize(model:, display_method:, value_method:, url: nil, as: nil, display_with: nil,
    editor_class: "d-none", input_class: nil, select_options: nil)
    @model = model
    @display_method = display_method
    @value_method = value_method
    @url = url
    @as = as
    @display_with = display_with
    @editor_class = editor_class
    @input_class = input_class
    @select_options = select_options
  end

  private

  def display_value
    val = ""
    val = @model.public_send(@display_method) if @model.respond_to?(@display_method)
    return @display_with.call(val) if @display_with&.is_a?(Proc)
    return render(@display_with) if @display_with&.is_a?(ViewComponent::Base)

    if @as == :select && @select_options.respond_to?(:find)
      opt = @select_options.find { |arr| arr.last.to_s == val.to_s }
      return opt.first unless opt.nil?
    end
    val
  end

  def form_options
    ret = {
      model: @model,
      class: "tie-editor #{@editor_class}"
    }
    ret[:url] = @url if @url.present?
    ret
  end

  def input_attributes
    ret = {
      data: {
        action: "blur->turbo-inline-edit#blur keydown->turbo-inline-edit#keydown"
      },
      class: "form-control #{@input_class}"
    }
    ret[:data][:action] += " change->turbo-inline-edit#blur" if @as == :select
    ret
  end

  def display_attributes
    {class: "tie-display", data: {action: "click->turbo-inline-edit#click"}}
  end
end