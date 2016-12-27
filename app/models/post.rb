require 'pry'
class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :clickbait

  def clickbait
    errors.add(:title, "is not clickbait-y") unless !title.nil? && ["Won't Believe", "Secret", "Top", "Guess"].any? {|word| title.include?(word)}
  end
end
