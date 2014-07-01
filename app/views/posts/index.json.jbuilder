json.array!(@posts) do |post|
  json.extract! post, :id, :category, :begin, :people
  json.url post_url(post, format: :json)
end
