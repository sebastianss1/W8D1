class Sub < ApplicationRecord
    validates :title, :description, :user_id, presence: true 

    belongs_to :moderator,
    foreign_key: :user_id,
    class_name: :User

    has_many :post_subs,
    foreign_key: :sub_id,
    class_name: :PostSub,
    inverse_of: :sub

    has_many :posts,
    through: :post_subs,
    source: :post




end 