module CommentsHelper
  def comments_image_html(_resource, value)
    image_tag url_for(value), width: "320"
  end

  def comments_annotation_json_html(_resource, value)
    return unless value

    tag.pre(JSON.pretty_generate(JSON.parse(value)))
  end
end
