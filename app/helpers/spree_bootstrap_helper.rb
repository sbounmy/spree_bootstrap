module SpreeBootstrapHelper
  def icon(icon_name, options={})
    options[:class] ||= ''
    options[:class] += " icon-#{icon_name}"
    content_tag(:i, '', options)
  end

  def flash_class(level)
    case level
    when :notice then "alert-info"
    when :error then "alert-error"
    when :alert then "alert-warning"
    end
  end

  def flash_messages(opts = {})
    opts[:ignore_types] = [:commerce_tracking].concat(Array(opts[:ignore_types]) || [])

    flash.each do |msg_type, text|
      unless opts[:ignore_types].include?(msg_type)
        concat(content_tag :div, text, :class => "alert #{flash_class(msg_type)}")
      end
    end
    nil
  end
end
