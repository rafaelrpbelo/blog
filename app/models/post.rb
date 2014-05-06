class Post < ActiveRecord::Base
  has_and_belongs_to_many :tags

  validates_presence_of :title, :body

  validate :presence_tags

private

  def presence_tags
    if tags.blank?
      errors.add(:base, 'Você deve selecionar pelo menos uma tag')
    end
  end
end
