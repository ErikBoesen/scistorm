class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post, polymorphic: true
    belongs_to :article, polymorphic: true
    belongs_to :comment, polymorphic: true
    validates :user_id, presence: true
    validates :content, presence: true

    acts_as_votable
end
