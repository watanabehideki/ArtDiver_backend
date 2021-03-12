json.array! @galleries do |gallery|
  json.id gallery.id
  json.name gallery.name
  json.image gallery.gallery_image.url
end

