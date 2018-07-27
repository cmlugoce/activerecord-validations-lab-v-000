class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction","Non-Fiction"] }
  validates :category, exclusion: { in: [nil] }
  validates :clickbait?

  @clickbait = ["Won't Believe", "Secret", "Top", "Guess"]
  def clickbait?

     if !@clickbait.any? {|word| word.match title}
      errors.add(:title, "not clickbait")
    end
  end
end
