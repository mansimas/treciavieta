json.array!(@articles) do |article|
  json.extract! article, :id, :food, :delivery, :tradition, :post_id
  json.url article_url(article, format: :json)
end
