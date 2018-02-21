module Layout
  def get_layout
    "layouts/application#{layout_namespace}"
  end

  def layout_namespace
    namespace.present? ? "_#{namespace}" : ''
  end
end
