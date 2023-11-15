desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do# Destroying Preevious Data
  pp "Destroying Previous Data"

  if Rails.env.development?
    User.destroy_all
    Item.destroy_all
    Outfit.destroy_all
    Category.destroy_all
  end

  #Generating User

  user = User.new
  user.id = 1
  user.name = "alice"
  user.email = "alice@example.com"
  user.password = "password"
  user.username = "alice"
  user.image_url = "https://www.littleglassjar.com/wp-content/uploads/2014/11/deer-head-silhouette.jpg"
  user.save

  #Generating Clothes

  pp "Generating clothes"

  CSV.foreach("lib/sample_data/clothes.csv", headers: true) do |row|
    Item.create(
      id: row['id'],
      name: row['name'],
      image_url: row['image_url'],
      size: row['size'],
      compliments: row['compliments'],
      user_id: row['user_id']
    )
  end

  puts "There are now #{Item.count} clothes"



  pp "Generating Categores "

  CSV.foreach("lib/sample_data/categories.csv", headers: true) do |row|
    Category.create(
      id: row['id'],
      name: row['name']
    )
  end

  puts "There are now #{Category.count} categories"

  pp "Generating outfits"

  CSV.foreach("lib/sample_data/outfits.csv", headers: true) do |row|
    Outfit.create(
      id: row['id'],
      image_url: row['image_url'],
      compliments: row['compliments'],
      user_id: row['user_id']
    )
  end

  puts "There are now #{Outfit.count} outfits"


end
