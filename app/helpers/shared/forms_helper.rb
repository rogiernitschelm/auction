module Shared::FormsHelper
  def input_field(title, f:, **attributes)
    content_tag :div, class: "form-field" do
       f.label(title, class: 'form-label', for: title) +
       f.text_field(
         title,
         placeholder: attributes[:placeholder] || title,
         autofocus: attributes[:autofocus] || false,
         autocomplete: attributes[:autocomplete] || false,
         id: attributes[:id] || title,
         required: attributes[:required] || true,
         type: attributes[:type] || 'text',
         class: 'with-validity-icon'
       )
    end
  end
end
