class User < ApplicationRecord
  attr_accessor :avatar_base
  before_validation :parse_avatar_base
  has_secure_password
  has_many(:reviews)

  validates :name, presence: true, length: { maximum: 25 }
  validates :username, :password,
            presence: true, length: { minimum: 6, maximum: 20 }
  validates :email, :password_confirmation, presence: true

  # validates_format_of :name, with: /[a-z]/i
  # validates_format_of :username, with: /[a-zA-Z0-9]/
  # validates_format_of :email,
  #                     with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  # validates_format_of :password, with: /(?=.*[A-Z]+)(?=.*[0-9]+).*/

  has_attached_file :avatar,
                    styles: { small: '64x64', med: '100x100', large: '200x200' },
                    :default_url => ':style/image.png'
  validates_attachment :avatar,
                       content_type: {
                         content_type: [
                           'image/jpg',
                           'image/jpeg',
                           'image/png',
                           'image/gif'
                         ]
                       },
                       size: { in: 0..10.megabytes }
  # The following method is required for user test fixtures to work.
  # It returns the hash digest of a given string.
  def self.digest(string)
    cost = if ActiveModel::SecurePassword.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end

    BCrypt::Password.create(string, cost: cost)
  end

  private

  def parse_avatar_base
    return unless avatar_base
    image = Paperclip.io_adapters.for(avatar_base)
    image.original_filename = "file.#{image.content_type.split('/')[1]}"
    self.avatar = image
  end

  has_secure_password
end
