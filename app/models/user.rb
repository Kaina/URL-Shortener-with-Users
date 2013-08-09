class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :urls

  validates :email, presence: true, uniqueness: true, email: true
  validates :name, presence: true
  validates :password_hash, presence: true

  include BCrypt

  def self.authenticate(email, a_password)
    @user = self.find_by_email(email)
    puts @user.password
    @user if @user.password == a_password
  end

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end
end
