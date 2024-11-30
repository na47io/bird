json.extract! post, :id, :body, :author, :created_at, :updated_at
json.url post_url(post, format: :json)
