class Inventory < ActiveRecord::Base
    belongs_to :user

    validates :year, presence: true
    validates :make, presence: true
    validates :model, presence: true
    validates :color, presence: true
    validates :amount, presence: true
end 