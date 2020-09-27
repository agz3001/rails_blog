class Article < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :body,  presence: true

  attachment :image

  def self.search(search)
    if search
      Article.where(['title LIKE ?', "%#{search}%"])
    else
      Article.all
    end
  end
end
