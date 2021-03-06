require "google/cloud/vision"

class Analysis < ApplicationRecord
  after_commit :set_annotations!, on: [:create, :update]
  has_one_attached :image

  validate :image_content_type, if: :was_attached?

  def image_content_type
    extension = ["image/png", "image/jpg", "image/jpeg"]
    errors.add(:image, "の拡張子が間違っています") unless image.content_type.in?(extension)
  end

  def was_attached?
    self.image.attached?
  end

  def set_annotations!
    return unless self.image
    return if self.before_image_id == self.image.id

    fetch_google_cloud_vision!
    self.update_columns(
      description: self.description,
      annotation_json: self.annotation_json,
      before_image_id: self.image.id
    )
  end

  def fetch_google_cloud_vision!
    return unless self.image
    return if self.before_image_id == self.image.id

    image_annotator = Google::Cloud::Vision::ImageAnnotator.new
    self.image.blob.open do |tmp_image|
      response = image_annotator.document_text_detection(
        image: tmp_image,
        max_results: 1
      )
      text_annotations = response.responses[0]&.text_annotations || []
      self.description = text_annotations[0]&.description
      self.annotation_json = text_annotations.map {|a| JSON.parse(a.to_json) }.to_json
    end
  end
end
