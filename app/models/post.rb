class Post < ApplicationRecord
  
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_attached_file :image,
                    styles: {medium: '600x600>', thumb: '100x100' },
                    default_url: '/images/:style/missing.png'
  validates_attachment_content_type :image,
                        content_type: ['image/jpeg', 'image/gif', 'image/png']

  validates :image, presence: true
end
