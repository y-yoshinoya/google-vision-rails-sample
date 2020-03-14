class CommentsController < CrudController
  permit_keys :content, :image

  def columns_for_index
    [:id] + super
  end

  def columns_for_advanced_search; end
end
