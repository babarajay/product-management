class Product < ApplicationRecord
  #
  ## Associations
  #
  belongs_to :user
  belongs_to :category
  has_many :comments

  #
  ## Validations
  #
  validates :name, :price, :description, presence: true

  def is_owner?(current_user_id)
    user_id == current_user_id
  end

  def self.import(file, current_user_id)
    require 'csv'

    CSV.foreach(file.path, headers: true) do |row|
      row = row.to_hash
      category = Category.where('name ILIKE ?', "%#{row['category']}%").first
      Product.create(name: row['name'], price: row['price'], description: row['description'], category_id: category.id, user_id: current_user_id)
    end
  end
end
