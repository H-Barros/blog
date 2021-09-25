class Post < ApplicationRecord
    extend FriendlyId
    include PgSearch

    validates :title, :author, :body, presence: true

    has_many :comments, dependent: :destroy

    friendly_id :title, use: :slugged

    pg_search_scope :search, 
        against: %i[title author body]
        # Caso queira fazer a busca em tabelas associadas também
        # associated_against: { comments: %i[body] }
end
