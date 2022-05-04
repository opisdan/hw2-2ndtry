# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!
Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.
# TODO!

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

#Studios############################################################

studio = Studio.new
studio["studio_name"] = "Warner Bros."
studio.save

wb = Studio.find_by({"studio_name"=>"Warner Bros."})

#Movies############################################################


movie = Movie.new
movie["movie_name"] = "Batman Begins"
movie["year"] = 2005
movie["rating"] = "PG-13"
movie["studio_id"] = wb["id"]
movie.save
bb = Movie.find_by({"movie_name"=>"Batman Begins"})

movie = Movie.new
movie["movie_name"] = "The Dark Knight"
movie["year"] = 2008
movie["rating"] = "PG-13"
movie["studio_id"] = wb["id"]
movie.save
tdk = Movie.find_by({"movie_name"=>"The Dark Knight"})

movie = Movie.new
movie["movie_name"] = "The Dark Knight Rises"
movie["year"] = 2012
movie["rating"] = "PG-13"
movie["studio_id"] = wb["id"]
movie.save
tdkr = Movie.find_by({"movie_name"=>"The Dark Knight Rises"})

all_movies = Movie.all

#Actors############################################################


actor = Actor.new
actor["name"] = "Christian Bale"
actor.save
c_b = Actor.find_by({"name"=>"Christian Bale"})

actor = Actor.new
actor["name"] = "Michael Caine"
actor.save
m_c = Actor.find_by({"name"=>"Michael Caine"})

actor = Actor.new
actor["name"] = "Liam Neeson"
actor.save
l_n = Actor.find_by({"name"=>"Liam Neeson"})

actor = Actor.new
actor["name"] = "Katie Holmes"
actor.save
k_h = Actor.find_by({"name"=>"Katie Holmes"})

actor = Actor.new
actor["name"] = "Gary Oldman"
actor.save
g_o = Actor.find_by({"name"=>"Gary Oldman"})

actor = Actor.new
actor["name"] = "Heath Ledger"
actor.save
h_l = Actor.find_by({"name"=>"Heath Ledger"})

actor = Actor.new
actor["name"] = "Aaron Eckhart"
actor.save
a_e = Actor.find_by({"name"=>"Aaron Eckhart"})

actor = Actor.new
actor["name"] = "Maggie Gyllenhaal"
actor.save
m_g = Actor.find_by({"name"=>"Maggie Gyllenhaal"})

actor = Actor.new
actor["name"] = "Tom Hardy"
actor.save
t_h = Actor.find_by({"name"=>"Tom Hardy"})

actor = Actor.new
actor["name"] = "Joseph Gordon-Levitt"
actor.save
j_gl = Actor.find_by({"name"=>"Joseph Gordon-Levitt"})

actor = Actor.new
actor["name"] = "Anne Hathaway"
actor.save
a_h = Actor.find_by({"name"=>"Anne Hathaway"})

#Roles############################################################
#Batman Begins

role = Role.new
role["movie_id"] = bb["id"]
role["actor_id"] = c_b["id"]
role["character"] = "Bruce Wayne"
role.save
role = Role.new
role["movie_id"] = bb["id"]
role["actor_id"] = m_c["id"]
role["character"] = "Alfred"
role.save
role = Role.new
role["movie_id"] = bb["id"]
role["actor_id"] = l_n["id"]
role["character"] = "Ra's Al Ghul"
role.save
role = Role.new
role["movie_id"] = bb["id"]
role["actor_id"] = k_h["id"]
role["character"] = "Rachel Dawes"
role.save
role = Role.new
role["movie_id"] = bb["id"]
role["actor_id"] = g_o["id"]
role["character"] = "Commissioner Gordon"
role.save


#INSERT INTO roles (movie_id, actor_id, character_name) VALUES (1, 1, "Bruce Wayne");
#INSERT INTO roles (movie_id, actor_id, character_name) VALUES (1, 2, "Alfred");
##INSERT INTO roles (movie_id, actor_id, character_name) VALUES (1, 3, "Ra's Al Ghul");
#INSERT INTO roles (movie_id, actor_id, character_name) VALUES (1, 4, "Rachel Dawes");
#INSERT INTO roles (movie_id, actor_id, character_name) VALUES (1, 5, "Commissioner Gordon");

#The Dark Knight

role = Role.new
role["movie_id"] = tdk["id"]
role["actor_id"] = c_b["id"]
role["character"] = "Bruce Wayne"
role.save
role = Role.new
role["movie_id"] = tdk["id"]
role["actor_id"] = m_c["id"]
role["character"] = "Alfred"
role.save
role = Role.new
role["movie_id"] = tdk["id"]
role["actor_id"] = h_l["id"]
role["character"] = "Joker"
role.save
role = Role.new
role["movie_id"] = tdk["id"]
role["actor_id"] = a_e["id"]
role["character"] = "Harvey Dent"
role.save
role = Role.new
role["movie_id"] = tdk["id"]
role["actor_id"] = m_g["id"]
role["character"] = "Rachel Dawes"
role.save

#The Dark Knight Rises

role = Role.new
role["movie_id"] = tdkr["id"]
role["actor_id"] = c_b["id"]
role["character"] = "Bruce Wayne"
role.save
role = Role.new
role["movie_id"] = tdkr["id"]
role["actor_id"] = g_o["id"]
role["character"] = "Commissioner Gordon"
role.save
role = Role.new
role["movie_id"] = tdkr["id"]
role["actor_id"] = t_h["id"]
role["character"] = "Bane"
role.save
role = Role.new
role["movie_id"] = tdkr["id"]
role["actor_id"] = j_gl["id"]
role["character"] = "John Blake"
role.save
role = Role.new
role["movie_id"] = tdkr["id"]
role["actor_id"] = a_h["id"]
role["character"] = "Selina Kyle"
role.save


bb_roles = Role.where({"movie_id" => bb["id"]})
tdk_roles = Role.where({"movie_id" => tdk["id"]})
tdkr_roles = Role.where({"movie_id" => tdkr["id"]})

# Prints a header for the movies output
puts "Movies"
puts "you have #{Studio.all.count} studios in the data base"
puts "you have #{Movie.all.count} movies in the data base"
puts "you have #{Actor.all.count} actors in the data base"
puts "you have #{Role.all.count} roles in the data base"
puts "for Batman Begins you have #{bb_roles.count} Roles"
puts "for The Dark Knight you have #{tdk_roles.count} Roles"
puts "for The Dark Knight Rises you have #{tdkr_roles.count} Roles"

#apple_contacts = Contact.where({ "company_id" => apple["id"] })

puts c_b["name"]
puts c_b["id"]
puts k_h["id"]
puts wb["movie_name"]
puts bb["studio_id"]
puts tdk["studio_id"]
puts tdkr["movie_name"]
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!
# 3. What is the full name of each contact who works at Apple?

# loop through contacts
#for contact in apple_contacts
    # read each contact row's first_name and last_name columns
 #   first_name = contact["first_name"]
  #  last_name = contact["last_name"]
    # display the first_name and last_name
   # puts "#{first_name} #{last_name}"
  #end

for movie in all_movies
    movie_name = movie["movie_name"]
    year = movie["year"]
    rating = movie["rating"]
    studio_name = studio["studio_name"]
    puts "#{movie_name} #{year} #{rating} #{studio_name}"
end




# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
for movie in all_movies
    bb_actor = Actor.find_by({"movie_id" => bb["id"]})
    movie_name = movie["movie_name"]
    actor_name = actor["name"]
    character = role["name"]
    puts "#{movie_name} #{actor_name} #{character}"
end

