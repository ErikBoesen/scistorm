class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :community, foreign_key: 'community_id'
  has_many :comments
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true
  validate  :picture_size

  acts_as_votable

  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end

end
