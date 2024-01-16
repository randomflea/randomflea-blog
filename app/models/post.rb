class Post < ApplicationRecord
    belongs_to :category, optional: true
    belongs_to :series, optional: true
    has_rich_text :content
end
