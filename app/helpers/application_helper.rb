module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Bitbucket Assitant App"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def add_fields_member f, association
    new_object = f.object.class.reflect_on_association(association).klass.new
    tmpl = f.fields_for(association, new_object,
      child_index: "new_#{association}") do |b|
      render "#{association.to_s.singularize}_form", f: b
    end
    tmpl = tmpl.gsub /(?<!\n)\n(?!\n)/, " "
    return "<script> var #{association.to_s}_form = '#{tmpl.to_s}' </script>"
      .html_safe
  end

end