class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :parent, class_name: 'User', counter_cache: :children_member, optional: true
  has_many :children, class_name: 'User', foreign_key: 'parent_id'

  mount_uploader :image, ImageUploader

  enum role: { client: 0, admin: 1 }
end
