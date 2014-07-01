json.array!(@bankets) do |banket|
  json.extract! banket, :id, :arrival, :departure, :places, :price, :post_id
  json.url banket_url(banket, format: :json)
end
