class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250  }
    validates :summary, length: { maximum: 250  }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :clickbait

    CLICKBAITABLE = [
        "Won't Believe",
        "Secret",
        "Top[number]",
        "Guess"
    ]
    
    def clickbait
        if title.present? && CLICKBAITABLE.none? {|p| title.match(p)}
            errors.add(:clickbait, "need more bait")
        end
    end
end

# All posts have a title
# Post content is at least 250 characters long
# Post summary is a maximum of 250 characters
# Post category is either Fiction or Non-Fiction
    # This step requires an inclusion validator, which was not outlined in the lesson.
    # You'll need to refer to the Rails guide (Links to an external site.) to look up how to use it.

    # Finally, add a custom validator to Post that ensures the title is sufficiently clickbait-y.
    # If the title does not contain "Won't Believe", "Secret", "Top [number]", or "Guess", the validator should add a validation.

