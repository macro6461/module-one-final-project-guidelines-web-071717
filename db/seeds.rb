# require 'rest-client'
# require 'json'
#
# url = 'https://imdb.p.mashape.com/movie'
# response = RestClient.get(url)
# JSON.parse(response)


#Movies
departed = Movie.create(title: "The Departed")
troy = Movie.create(title: "Troy")
titanic = Movie.create(title: "Titanic") #second movie for leo
inglorious = Movie.create(title: "Inglorious Basterds") #second movie for brad
brave_heart = Movie.create(title: "Braveheart")
lethal_weapon = Movie.create(title: "Lethal Weapon")
dodgeball = Movie.create(title: "Dodgeball")
her = Movie.create(title: "Her")
elf = Movie.create(title: "Elf")
daddys_home = Movie.create(title: "Daddy's Home")
other_guys = Movie.create(title: "The Other Guys")
talladega_nights = Movie.create(title: "Talladega Nights")
the_reader = Movie.create(title: "The Reader")
help = Movie.create(title: "The Help")
fences = Movie.create(title: "Fences")
equalizer = Movie.create(title: "The Equalizer")




#Actors
brad_pitt = Actor.create(name: "Brad Pitt")
leo_dicaprio = Actor.create(name: "Leonardo DiCaprio")
mel_gibson = Actor.create(name: "Mel Gibson")
scarlett_johannson = Actor.create(name: "Scarlett Johannson")
ben_stiller = Actor.create(name: "Ben Stiller")
vince_vaughn = Actor.create(name: "Vince Vaughn")
will_ferrell = Actor.create(name: "Will Ferrell")
mark_wahlberg = Actor.create(name: "Mark Wahlberg")
john_rielly = Actor.create(name: "John C. Reilly")
kate_winslet = Actor.create(name: "Kate Winslet")
octavia = Actor.create(name: "Octavia Spencer")
viola = Actor.create(name: "Viola Davis")
denzel = Actor.create(name: "Denzel Washington")




#Characters
billy_costigan = Character.create(name: "Billy Costigan", actor_id: leo_dicaprio.id, movie_id: departed.id)
achilles = Character.create(name: "Achilles", actor_id: brad_pitt.id, movie_id: troy.id)
aldo_rain = Character.create(name: "Aldo Rain", actor_id: brad_pitt.id, movie_id: inglorious.id) #second character for Brad Pitt
jack = Character.create(name: "Jack", actor_id: leo_dicaprio.id, movie_id: titanic.id) #second character for leo dicaprio
samantha = Character.create(name: "Samantha", actor_id: scarlett_johannson.id, movie_id: her.id)
la_floor = Character.create(name: "LaFloor", actor_id: vince_vaughn.id, movie_id: dodgeball.id)
white_goodman = Character.create(name: "White Goodman", actor_id: ben_stiller.id, movie_id: dodgeball.id)
william_wallace = Character.create(name: "William Wallace", actor_id: mel_gibson.id, movie_id: brave_heart.id)
martin_riggs = Character.create(name: "Martin Riggs", actor_id: mel_gibson.id, movie_id: lethal_weapon.id)
buddy = Character.create(name: "Buddy the Elf", actor_id: will_ferrell.id, movie_id: elf.id)
dusty = Character.create(name: "Dusty Mayron", actor_id: mark_wahlberg.id, movie_id: daddys_home.id)
brad = Character.create(name: "Brad Whitaker", actor_id: will_ferrell.id, movie_id: daddys_home.id)
allen = Character.create(name: "Allen Gamble", actor_id: will_ferrell.id, movie_id: other_guys.id)
terry = Character.create(name: "Terry Hoitz", actor_id: mark_wahlberg.id, movie_id: other_guys.id)
cal = Character.create(name: "Cal Naughton Jr.", actor_id: john_rielly.id, movie_id: talladega_nights.id)
ricky = Character.create(name: "Ricky Bobby", actor_id: will_ferrell.id, movie_id: talladega_nights.id)
hanna = Character.create(name: "Hanna Schmitz", actor_id: kate_winslet.id, movie_id: the_reader.id)
minny = Character.create(name: "Minny Jackson", actor_id: octavia.id, movie_id: help.id)
rose_maxson = Character.create(name: "Rose Maxson", actor_id: viola.id, movie_id: fences.id)
troy_maxson = Character.create(name: "Troy Maxson", actor_id: denzel.id, movie_id: fences.id)
robert = Character.create(name: "Robert McCall", actor_id: denzel.id, movie_id: equalizer.id)















# luke_skywalker = Character.create(name: 'Luke SKywlaker', actor: Actor.create(first_name: "Mark", last_name: "Hammil"))
