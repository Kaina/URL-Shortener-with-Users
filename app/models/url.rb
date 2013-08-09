class Url < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user

  validates :long_url, presence: true, uniqueness: true, format: { with: URI.regexp(['http', 'https']) }
  validates :short_url, uniqueness: true

  before_create :shorten_url

  def shorten_url
    temp_short = SecureRandom.urlsafe_base64(5)
    if Url.where(short_url: temp_short).any?
      shorten_url
    else
      self.short_url = temp_short
    end
  end

  def increment_click_count
    self.click_count = click_count + 1
    self.save
  end
end
