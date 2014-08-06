include ApplicationHelper
=begin
#the whole is commented and by just iclude the above ApplicationHelper
#will do the exact thing as a result we are DRY out our code.
def full_title(page_title)
  base_title = "Ruby on Rails Tutorial Sample App"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end
=end