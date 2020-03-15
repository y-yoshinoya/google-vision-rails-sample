class CommentsController < CrudController
  permit_keys :content, :image

  def columns_for_index
    [:id] + super
  end

  def columns_for_show
    [:id, :content, :description, :annotation_json, :image]
  end

  def columns_for_advanced_search; end
end
