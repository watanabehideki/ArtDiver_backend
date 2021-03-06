json.array! @exhibitions do |exhibition|
  json.id exhibition.id
  json.title exhibition.title
  json.start_date exhibition.start_date.to_s
  json.end_date exhibition.end_date.to_s
  json.gallery.name exhibition.gallery.name
end

