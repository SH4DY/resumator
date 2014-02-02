json.array!(@area_attributes) do |area_attribute|
  json.extract! area_attribute, :id, :name, :value
  json.url area_attribute_url(area_attribute, format: :json)
end
