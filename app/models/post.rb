# encoding: utf-8
class Post < ActiveRecord::Base
  has_and_belongs_to_many :tags

  validates_presence_of :title, :body

  validate :presence_tags

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

private

  def presence_tags
    if tags.blank?
      errors.add(:base, 'Você deve selecionar pelo menos uma tag') unless Tag.all.count < 1
    end
  end
end
