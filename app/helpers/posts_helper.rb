module PostsHelper
  def highlight_hashtags(text)
    # Replace hashtags with highlighted spans
    text.gsub(/#\w+(?=\s|$)/) do |tag|
      "<span class='highlighted-tag'>#{tag}</span>"
    end.html_safe
  end
end
