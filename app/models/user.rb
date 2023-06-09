class User < ApplicationRecord

  validates :username, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :parent, class_name: 'User', counter_cache: :children_member, optional: true
  has_many :children, class_name: 'User', foreign_key: 'parent_id'

  has_many :user_address

  has_many :bets
  has_many :orders
  has_many :winners
  has_many :winners, class_name: 'Winner', foreign_key: :admin_id

  mount_uploader :image, ImageUploader

  enum role: { client: 0, admin: 1 }
end
