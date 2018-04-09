# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
area_attributes = [
    {
        id: 1,
        neighborhood:"East Village"
        },
    {
        id: 2,
        neighborhood:"Little Italy"
        },
    {
        id: 3,
        neighborhood:"North Park"
        },
    {
        id: 4,
        neighborhood:"Hillcrest"
        },
    {
        id: 5,
        neighborhood:"Gaslamp Quarter"
        },
    {
        id: 6,
        neighborhood:"Coronado"
        },
    {
        id: 7,
        neighborhood:"Shelter Island Area"
        },
    {
        id: 8,
        neighborhood:"Ocean Beach"
        },
    {
        id: 9,
        neighborhood:"Loma Portal"
    }
]
area_attributes.each do |attributes|
  Area.create(attributes)
end


user_attributes = [
    {
        name: "Dean",
        username:"FDR1510",
        email:"frankiedean1510@yahoo.com",
        password:"rosales1510",
        password_confirmation:"rosales1510"
    },
    {
        name: "Frankie",
        username:"RapidFap",
        email:"thetank81g@gmail.com",
        password:"dean2013",
        password_confirmation:"dean2013"
    }
]
user_attributes.each do |attributes|
  User.create(attributes)
end

 [
  {
    area: Area.find_by_neighborhood("Little Italy"),
    area_rating: 4,
    dining: 4,
    parking: 4,
    cleanliness: 4,
    safety: 4,
    price: 4,
    family_friendly: true,
    review_text: "Little Italy reminded of my visit in Rome. Super Rad!",
    user_id: 5
  }
].each do |attributes|
  Review.create(attributes)
end
