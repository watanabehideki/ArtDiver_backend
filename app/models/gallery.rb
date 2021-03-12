class Gallery < ApplicationRecord
  has_many :exhibitions, dependent: :destroy

  mount_uploader :gallery_image, GalleryImageUploader





  # def image_url
  #   # 紐づいている画像のURLを取得する
  #   image.attached? ? url_for(image) : nil
  # end


  # def encode_base64(image_file)
  #   image = Base64.encode64(image_file.download) # 画像ファイルをActive Storageでダウンロードし、エンコードする
  #   blob = ActiveStorage::Blob.find(image_file[:id]) # Blobを作成
  #   "data:#{blob[:content_type]};base64,#{image}" # Vue側でそのまま画像として読み込み出来るBase64文字列にして返す
  # end

end
