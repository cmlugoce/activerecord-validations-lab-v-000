class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction","Non-Fiction"] }
  validates :category, exclusion: { in: [nil] }
  validates :clickbait

  @@clickbait = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]
  def clickbait?

    if @@clickbait.none? {|pat| pat.match self.title}
      errors.add(:title, "must be clickbait")
    end
  end
end
