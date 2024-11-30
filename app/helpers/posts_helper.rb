module PostsHelper
  def highlight_hashtags(text)
    # Replace hashtags with highlighted links
    text.gsub(/#\w+(?=\s|$)/) do |tag|
      link_to(tag, posts_path(q: tag), class: "highlighted-tag")
    end.html_safe
  end

  def format_content(text)
    # First detect URLs and convert to links
    linked_text = text.gsub(URI.regexp) do |url|
      link_to(url, url, target: "_blank", rel: "noopener")
    end
    
    # Then process hashtags
    highlight_hashtags(linked_text)
  end
end
