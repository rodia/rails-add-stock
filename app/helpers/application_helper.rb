module ApplicationHelper
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

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end
end
