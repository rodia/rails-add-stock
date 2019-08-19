class Admin::Search
  def initialize(page, page_size, keywords)
    @page = page
    @page_size = page_size
    @offset = page_size * page
    @keywords = keywords
  end

  def brands_by_name
   if @keywords.present?
     products = Admin::Product.where(name_condition).order(:description).offset(@offset).limit(@page_size)
     @number_of_records = Admin::Product.where(name_condition).count
   else
     products = Admin::Product.order(:description).offset(@offset).limit(@page_size)
     @number_of_records = Admin::Product.count
   end
 
   return products, number_of_pages
  end

 private

 def name_condition
  name_condition = "unaccent(lower(description)) LIKE '%#{I18n.transliterate(@keywords.downcase)}%'"
 end

 def number_of_pages
  number_of_pages = (@number_of_records % @page_size) == 0 ? 
  @number_of_records / @page_size - 1 : @number_of_records / @page_size
 end
end
