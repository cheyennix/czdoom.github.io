Jekyll::Hooks.register :documents, :pre_render do |document|
  document.content = document.content.gsub(/\[([^\]]+)\]\(([^)]+)\.md\)/, '[\1](\2/)')
end

Jekyll::Hooks.register :pages, :pre_render do |page|
  page.content = page.content.gsub(/\[([^\]]+)\]\(([^)]+)\.md\)/, '[\1](\2/)')
end