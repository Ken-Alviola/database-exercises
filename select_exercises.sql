#Use the albums_db database.
use `albums_db`;

#Explore the structure of the albums table.
select *
from albums;

#The name of all albums by Pink Floyd
select name
from albums
where artist = 'Pink Floyd';

#The year Sgt. Pepper's Lonely Hearts Club Band was released
select release_date
from albums
where name = "Sgt. Pepper's Lonely Hearts Club Band";

#The genre for the album Nevermind
select genre
from albums
where name = 'Nevermind';

#Which albums were released in the 1990s
select NAME, release_date #added release_date to verify
from albums
where `release_date` between 1990 and 1999;

#Which albums had less than 20 million certified sales
select NAME, sales
from albums
where sales < 20;

#All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"? (where clause only specifies where genre is 'Rock' only.
select NAME, genre
from albums
where genre = 'Rock';