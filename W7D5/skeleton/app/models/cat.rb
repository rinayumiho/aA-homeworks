class Cat < ApplicationRecord
    include Toyable
    validates :name, presence: true

    # has_many :toys, as: :toyable
end
