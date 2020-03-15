class CommentsController < CrudController
  default_sort_key :id
  default_sort_order :desc
  permit_keys :content, :image

  def columns_for_index
    [:id] + super
  end

  def columns_for_show
    [:id, :content, :image, :analyzed_image, :description, :annotation_json]
  end

  def columns_for_search
    [:description, :content]
  end

  def columns_for_advanced_search; end
end
