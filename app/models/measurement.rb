class Measurement < ApplicationRecord
    validates :end_at, comparison: { greater_than: :start_at, allow_nil: true }
end
