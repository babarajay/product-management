class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #
  ## Associations
  #
  has_many :products
  has_many :comments

  #
  ## Validations
  #
  validates :first_name, :last_name, presence: true
  validates :phone, presence: { message: 'must be a number'}, numericality: true, length: { minimum: 10, maximum: 15 }

  def full_name
    "#{first_name} #{last_name}"
  end
end
