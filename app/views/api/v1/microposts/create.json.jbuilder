  json.id @micropost.id
  json.user_id @micropost.user_id
  json.content @micropost.content
  json.exhibition_id @micropost.exhibition_id
  json.created_at @micropost.created_at.to_s(:date)
