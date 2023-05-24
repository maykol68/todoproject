class Task < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true
    validates :start_date, presence: true
    validates :end_date,  presence: true

    belongs_to :user, default:  -> { Current.user }
end
