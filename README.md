# Record Collection
Create and manipulate a SQLite database containing information about a record collection.

## Part 1: Live Code
Together, we will examine and discuss the included _csv_ file. We will determine the appropriate table structure and data types for all of the data it contains. This definition of structure and data types is known as the database _schema_.

After planning the _schema_, we will create a Ruby script (`lib/setup_db.rb`) to execute the necessary SQL code to create a database in `database/record-collection.sqlite`.

Now that we have a database ready to store data, extend `lib/setup_db.rb` to read the included csv file and _insert_ the data it contains into the database after it creates a fresh database.

Each line in the _csv_ should correspond to a single _row_ in the database table.

## Part 2: Chair-Pair Exercise
Now that we've got a database with both schema and data, create a new Ruby file (`lib/queries.rb`). This file will contain methods that query the database. I recommend wrapping these methods in a `class` or `module` to aid organization, modularity, and reusability. Don't get too hung up on organization yet though; that can be a refactor step later.

At the bottom of this README is a list of questions about the data. Each question will require at least one database query to answer. Any querying you do should be a part of a Ruby method. Here's an example:

```ruby
  def count_releases
    # your code & queries here
  end

  # Question 1: How many albums are in the collection?
  "Answer 1: There are #{ count_releases } releases in the database."
```

### The Questions
1. How many albums are in the collection?
1. How many unique artist entries are in the collection?
1. What is the oldest (earliest release year) release in the database?
1. Which album was most recently added to the collection?
1. What was the first album added to the collection?
1. How many albums were added to the collection in 2014?
1. How many albums were released between 1970 and 1979?

#### Bonus Questions
The questions in this section are more difficult and will require some extra research to answer using just SQL queries.

1. Which artist has the most albums in the collection?
1. Which year has the most releases? How many albums were released in that year?
1. What years between 1960 and 2010 have zero releases?
