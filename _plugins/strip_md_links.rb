Jekyll::Hooks.register :documents, :post_render do |document|
  # Get the site's baseurl
  baseurl = document.site.config['baseurl'] || ''
  
  # Convert links with .md extension to Jekyll permalinks
  # Handles both absolute (/path/file.md) and relative (path/file.md) links
  document.output = document.output.gsub(/href="([^"]+)\.md"/) do |match|
    link_path = $1
    
    # Add leading slash if not present
    link_path = "/#{link_path}" unless link_path.start_with?('/')
    
    # Add baseurl and trailing slash
    "href=\"#{baseurl}#{link_path}/\""
  end
end

Jekyll::Hooks.register :pages, :post_render do |page|
  # Get the site's baseurl
  baseurl = page.site.config['baseurl'] || ''
  
  # Same conversion for pages
  page.output = page.output.gsub(/href="([^"]+)\.md"/) do |match|
    link_path = $1
    
    # Add leading slash if not present
    link_path = "/#{link_path}" unless link_path.start_with?('/')
    
    # Add baseurl and trailing slash
    "href=\"#{baseurl}#{link_path}/\""
  end
end