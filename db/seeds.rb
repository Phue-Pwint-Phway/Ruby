# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!([
    {
        name: 'phuepwintphway',
        email: 'phuepwintphway@gmail.com',
        password: '123',
        profile: "phue",
        role: '1',
        phone: '09123456789',
        address: '1111',
        dob: '2007-07-07',
        create_user_id: '12',
        updated_user_id: '12'
    }
])
users = User.new(name: "ei", email: "ei@gmail.com", password_digest: "ei", profile: "ei", role:"1", phone: "0012345", address: "pazudaung", dob: "2007-07-07 00:00:00", create_user_id: "12", updated_user_id: "12", created_at: "2021-09-28 06:36:53.058499", updated_at: "2021-09-28 06:36:53.058499")
