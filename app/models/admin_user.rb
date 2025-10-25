class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  def self.ransackable_attributes(_ = nil)
    %w[id email created_at updated_at]
  end

  def self.ransackable_associations(_ = nil)
    []
  end
end
