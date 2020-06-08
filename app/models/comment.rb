class Comment < ApplicationRecord
  #
  ## Associations
  #
  belongs_to :user
  belongs_to :product

  #
  ## Validations
  #
  validates :comment, presence: true

  def is_owner?(current_user_id)
    user_id == current_user_id
  end
end
