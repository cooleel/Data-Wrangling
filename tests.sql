CREATE TABLE Album
(
    AlbumId INTEGER PRIMARY KEY,
    Title TEXT,
    ArtistId INTEGER,
    FOREIGN KEY (ArtistId) REFERENCES Artist (ArtistId) 
);

CREATE TABLE InvoiceLine
(
InvoiceLineId INTEGER PRIMARY KEY,
InvoiceId INTEGER,
TrackId INTEGER,
UnitPrice REAL,
Quantity INTEGER,
FOREIGN KEY (InvoiceId) REFERENCES Invoice(InvoiceId),
FOREIGN KEY (TrackId) REFERENCES Track(TrackId)); 


'''EXPORT DATA TO CSV FROM DATABASE'''
sqlite> .mode csv
sqlite> .output newFile.csv
sqlite> SELECT * FROM myTable;
sqlite> .exit


'''IMPORT YOUR CSV INTO A TABLE
$ sqlite3 new.db   <--- If you'd like your csv's in a new database remember to make it first.

sqlite> CREATE TABLE myTable() <--- Build your schema!
sqlite> .mode csv
sqlite> .import File.csv myTable

'''How many 'Pop' songs have an 'MPEG audio file' type?'''
SELECT COUNT(Genre.Name) FROM Genre,Track,MediaType
ON Genre.GenreId = Track.GenreId AND Track.MediaTypeId = MediaType.MediaTypeId
WHERE MediaType.Name = 'MPEG audio file' AND Genre.Name = 'Pop';


'''How many unique customers have purchased a Jazz track'''
SELECT COUNT(distinct Invoice.CustomerId)
FROM Invoice,InvoiceLine,Track,Genre
ON Invoice.InvoiceId = InvoiceLine.InvoiceId AND InvoiceLine.TrackId = Track.TrackId AND Track.GenreId = Genre.GenreId
WHERE Genre.Name = 'Jazz';
