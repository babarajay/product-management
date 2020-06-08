unless Category.any?
  ['Men', 'Women', 'Children'].each do |category|
    Category.create!(name: category)
  end
end