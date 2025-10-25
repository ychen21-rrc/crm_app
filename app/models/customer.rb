class Customer < ApplicationRecord
  has_one_attached :image

  validates :full_name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true

  def self.ransackable_attributes(auth_object = nil)
    %w[full_name phone_number email notes created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[image_attachment image_blob]
  end
end
