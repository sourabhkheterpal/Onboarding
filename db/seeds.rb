# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
  secret = SecretCode.create({code: 'ADMIN'})
  user = User.new({first_name: 'Admin', last_name: "", email: "admin@onboard.com", password: 'admin123', secret_code_indeifier: 'ADMIN'})
  user.roles = ['admin']
  user.save
