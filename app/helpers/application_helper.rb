module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'Shop'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  def get_categories
    @categories = Category.all
  end

end
