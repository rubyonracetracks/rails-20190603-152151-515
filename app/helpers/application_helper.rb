#
module ApplicationHelper
  # BEGIN: full_title
  # Returns the full title on a per-page basis
  def full_title(page_title = '')
    base_title = 'Generic App Template'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end
  # END: full_title

  # rubocop:disable Naming/UncommunicativeMethodParamName
  def link_to_add_fields(name, f, type)
    new_object = f.object.send "build_#{type}"
    id = "new_#{type}"
    fields = f.send("#{type}_fields", new_object, child_index: id) do |builder|
      render(type.to_s + '_fields', f: builder)
    end
    link_to(name, '#', class: 'add_fields',
                       data: { id: id, fields: fields.delete("\n") })
  end
  # rubocop:enable Naming/UncommunicativeMethodParamName
end
