class Community < ApplicationRecord
    has_many :posts, dependent: :destroy # TODO: Determine whether it's a good idea to destroy dependents
    has_many :users
end
