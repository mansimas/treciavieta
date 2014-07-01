json.array!(@contacts) do |contact|
  json.extract! contact, :id, :name, :lastname, :phone, :email, :additional_info, :price, :post_id
  json.url contact_url(contact, format: :json)
end
