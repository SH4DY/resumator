json.array!(@placeholders) do |placeholder|
  json.extract! placeholder, :id, :position
  json.url placeholder_url(placeholder, format: :json)
end
