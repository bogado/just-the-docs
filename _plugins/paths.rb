Jekyll::Hooks.register :documents, :post_init do |page|
  path = Pathname.new(page.path)
  break if path.dirname == '/'

  Jekyll.logger.debug 'Data:', page.data

  name = path.to_s.sub('/',' ').strip
  if page.index?
    page.data[:has_children] = true
    page.data[:title] = name
  else
page.data[:page-parent] = name
  end
end
