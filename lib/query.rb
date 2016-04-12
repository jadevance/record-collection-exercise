require 'sqlite3'
require_relative 'setup_db.rb'

class Query 
  
  def initialize(dbname = "releases")
    # This does NOT make a new database. It connects TO the database 
    @db = SQLite3::Database.new "database/#{dbname}.db"
  end

	def count_releases
		puts "Counting releases..."

		query = <<-COUNTS
		  SELECT COUNT(*)
		  FROM albums;
		COUNTS

		count_releases = @db.execute(query) 
		puts "Answer 1: There are #{ count_releases } albums are in the collection."
	end

	def count_unique_artists
		puts "Counting unique artists..."

		query = <<-COUNTS
		  SELECT COUNT (DISTINCT artist)
		  FROM albums;
		COUNTS

		count_artists = @db.execute(query) 
		puts "Answer 2: There are #{ count_artists } unique artists in the collection."
	end 

	def locate_oldest_release
		puts "Locating oldest release..."

		query = <<-OLDEST
		  SELECT MIN(released), title
		  FROM albums
		  WHERE released != 0; 
		OLDEST

		oldest_release = @db.execute(query)[0][1]

		puts "Answer 3: The oldest release is #{ oldest_release } in the collection."
	end 

	def find_last_added
			puts "Locating most recently added album..."

			query = <<-LAST
			  SELECT MAX (date_added), title
			  FROM albums;
			LAST

			last_added = @db.execute(query)[0][1]


			puts "Answer 4: The last added is #{ last_added } in the collection."

	end 

	def find_first_added
			puts "Locating first album added to the collection..."

			query = <<-FIRST
			  SELECT MIN (date_added), title
			  FROM albums;
			FIRST

			first_added = @db.execute(query)[0][1]


			puts "Answer 5: The first added is #{ first_added } in the collection."

	end 

	def count_added_2014
		puts "Locating albums added in 2014..."

		query = <<-2014
		  SELECT COUNT(released)
		  FROM albums
		  WHERE date_added LIKE '2014%'; 
		2014

		added_2014 = @db.execute(query)[0][0]

		puts "Answer 6: #{ added_2014 } albums were added in 2014."
	end 

	def count_released_70s
		puts "Locating albums from the 70s..."

		query = <<-70s
		  SELECT COUNT(title)
		  FROM albums
		  WHERE released BETWEEN 1970 AND 1979; 
		70s

		released_70s = @db.execute(query)[0][0]

		puts "Answer 7: #{ released_70s } were released between 1970 and 1979."
	end 

	# def count_most_albums
	# 	puts "Locating which artist has the most albums..."

	# 	query = <<-MOST
	# 	  SELECT artist
	# 	  FROM albums
	# 	  GROUP BY title
	# 	  ORDER BY artist
	# 	  COUNT (*)
	# 	  WHERE ROWNUM<=1; 
	# 	MOST

	# 	most_albums = @db.execute(query)

	# 	puts "Answer 8: #{ most_albums } were released by this artist."
	# end

end 
ReleaseDatabase.new.setup!
stuff = Query.new
stuff.count_releases
stuff.count_unique_artists
stuff.locate_oldest_release
stuff.find_last_added
stuff.find_first_added
stuff.count_added_2014
stuff.count_released_70s
# stuff.count_most_albums


# Which artist has the most albums in the collection?
# Which year has the most releases? How many albums were released in that year?
# What years between 1960 and 2010 have zero releases?

