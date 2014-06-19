json.array!(@images) do |image|
  json.extract! image, :id, :title, :image
  json.url image_url(image, format: :json)
end
