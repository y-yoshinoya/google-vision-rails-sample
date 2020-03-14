module CommentsHelper
  def comments_image_html(_resource, value)
    image_tag url_for(value), width: "320"
  end
end
