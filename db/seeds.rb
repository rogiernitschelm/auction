User.destroy_all
main_user = User.create!(
  email: 'mail@hoogle.nom',
  first_name: 'Vis',
  last_name: 'genaamd Henk',
  password: 'abcd1234'
)

Admin.create!(user: main_user)

names = [
  { first_name: 'Henk', last_name: 'Specht' },
  { first_name: 'Hermien', last_name: 'Boer' },
  { first_name: 'SponsRob', last_name: 'Bruin' },
  { first_name: 'Annemijn', last_name: 'Karelse' },
  { first_name: 'Karel', last_name: 'Kakbeer' },
  { first_name: 'Kees', last_name: 'Kroket' },
  { first_name: 'Shirley', last_name: 'Boer' },
  { first_name: 'Grietje', last_name: 'Hans' },
  { first_name: 'Marie', last_name: 'Scheisse' },
  { first_name: 'Pietertje', last_name: 'Pieterse' },
]

def email(name)
  "#{name[:first_name]}@#{name[:last_name]}.com"
end

names.each do |name|
  User.create!(
    email: email(name),
    password: 'abcd1234',
    first_name: name[:first_name],
    last_name: name[:last_name]
  )
end
