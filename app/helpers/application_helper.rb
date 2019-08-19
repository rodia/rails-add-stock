module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "ADDStock"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def current_class?(test_path)
    request.path == test_path ? 'active' : ''
  end
end
