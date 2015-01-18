json.array!(@photos) do |photo|
  json.extract! photo, :id, :title, :timestamp, :extension, :description
  json.url photo_url(photo, format: :json)
end
