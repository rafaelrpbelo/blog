module ApplicationHelper
  def errors_explanation(resource)
    if resource.errors.any?
      messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join

      html = <<-HTML
      <div id=''>
        <h3>#{ I18n.t 'form.error.message' }</h3>
        <ul>#{ messages }</ul>
      </div>
      HTML

      html.html_safe
    end
  end
end
