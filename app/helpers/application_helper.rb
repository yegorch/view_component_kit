module ApplicationHelper
  def turbo_inline_editor(model, field, **opts)
    opts[:display_method] = field unless opts[:display_method].present?
    editor = render(TurboInlineEditorComponent.new(model: model, value_method: field, **opts))
    content_tag(:span, editor, data: {controller: "turbo-inline-edit"})
  end
end
