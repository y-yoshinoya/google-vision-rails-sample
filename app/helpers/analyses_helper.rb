module AnalysesHelper
  def analyses_id_html(resource, value)
    link_to(value, resource)
  end

  def analyses_image_html(resource, value)
    url = url_for(value)
    link_to(image_tag(url, width: "500"), resource)
  end

  def analyses_analyzed_image_html(resource, _value)
    url = url_for(resource.image)
    tag.div do
      concat canvas(resource)
      concat canvas_script(url, resource)
    end
  end

  def canvas(resource)
    tag.canvas(id: resource.object_id, width: 500)
  end

  def canvas_script(image_url, resource)
    script = javascript_tag(<<-JS)
      $(function() {
        var canvasId = "#{resource.object_id}";
        var imageUrl = "#{image_url}";
        var annotations = #{resource.annotation_json};
        GoogleCloudVisionUtils.renderCanvas(canvasId, imageUrl, annotations);
      });
    JS
    safe_join([script])
  end

  def analyses_annotation_json_html(_resource, value)
    return unless value

    tag.pre(JSON.pretty_generate(JSON.parse(value)), style: "height: 300px; background-color: #EEEEEE")
  end
end
