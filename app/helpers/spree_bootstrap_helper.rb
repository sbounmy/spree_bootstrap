module SpreeBootstrapHelper
  def icon(icon_name, options={})
    options[:class] ||= ''
    options[:class] += " icon-#{icon_name}"
    content_tag(:i, '', options)
  end
end
