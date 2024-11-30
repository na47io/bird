module PostsHelper
  def highlight_hashtags(text)
    # Replace hashtags with highlighted links
    text.gsub(/#\w+(?=\s|$)/) do |tag|
      link_to(tag, posts_path(q: tag), class: "highlighted-tag")
    end.html_safe
  end
end
