
#Movies
departed = Movie.create(title: "The Departed")
troy = Movie.create(title: "Troy")
titanic = Movie.create(title: "Titanic") #second movie for leo
inglorious = Movie.create(title: "Inglorious Basterds") #second movie for brad
brave_heart = Movie.create(title: "Braveheart")
lethal_weapon = Movie.create(title: "Lethal Weapon")
dodgeball = Movie.create(title: "Dodgeball")
her = Movie.create(title: "Her")

#Actors
brad_pitt = Actor.create(first_name: "Brad", last_name: "Pitt")
leo_dicaprio = Actor.create(first_name: "Leonardo", last_name: "DiCaprio")
mel_gibson = Actor.create(first_name: "Mel", last_name: "Gibson")
scarlet_johannson = Actor.create(first_name: "Scarlet", last_name: "Johannson")
ben_stiller = Actor.create(first_name: "Ben", last_name: "Stiller")
vince_vaughn = Actor.create(first_name: "Vince", last_name: "Vaughn")

#Characters
billy_costigan = Character.create(name: "Billy Costigan", actor_id: leo_dicaprio.id, movie_id: departed.id)
achilles = Character.create(name: "Achilles", actor_id: brad_pitt.id, movie_id: troy.id)
aldo_rain = Character.create(name: "Aldo Rain", actor_id: brad_pitt.id, movie_id: inglorious.id) #second character for Brad Pitt
jack = Character.create(name: "Jack", actor_id: leo_dicaprio.id, movie_id: titanic.id) #second character for leo dicaprio
samantha = Character.create(name: "Samantha", actor_id: scarlet_johannson.id, movie_id: her.id)
la_floor = Character.create(name: "LaFloor", actor_id: vince_vaughn.id, movie_id: dodgeball.id)
white_goodman = Character.create(name: "White Goodman", actor_id: ben_stiller.id, movie_id: dodgeball.id)
william_wallace = Character.create(name: "William Wallace", actor_id: mel_gibson.id, movie_id: brave_heart.id)
martin_riggs = Character.create(name: "Martin Riggs", actor_id: mel_gibson.id, movie_id: lethal_weapon.id)



# luke_skywalker = Character.create(name: 'Luke SKywlaker', actor: Actor.create(first_name: "Mark", last_name: "Hammil"))
