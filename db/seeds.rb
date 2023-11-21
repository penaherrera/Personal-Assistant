# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def create_user(username, password)
    User.create!(
      username: username,
      password: password,
      created_at: Time.current,
      updated_at: Time.current,
      password_digest: BCrypt::Password.create(password)
    )
  end
  
  def create_note(title, content, user)
    Note.create!(
      title: title,
      content: content,
      user: user,
      created_at: Time.current,
      updated_at: Time.current
    )
  end
  
  def create_reminder(title, datetime, user)
    Reminder.create!(
      title: title,
      datetime: datetime,
      user: user,
      created_at: Time.current,
      updated_at: Time.current
    )
  end

    user1 = create_user("alex", "DAW1")
    user2 = create_user("jose", "DAW2")

    create_note("Proyecto DAW", "Presentar el proyecto final de  de DAW", user1)
    create_note("Futbol", "Partidoi de futbol 8:00pm bernal", user1)
    
    create_note("POO", "Proyecto de catedra POO", user2)
    create_note("Usuario", "Mi usuario es user2", user2)

    create_reminder("Comprar las tortillas", Time.current + 1.day, user1)
    create_reminder("Comprar don poyo", Time.current + 2.days, user1)
    
    create_reminder("Trabajar", Time.current + 1.day, user2)
    create_reminder("Darle de comer al perro", Time.current + 2.days, user2)