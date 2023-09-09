-- 1
SELECT 
    *
FROM
    customer;
SELECT DISTINCT
    a.first_name, a.last_name, a.email, e.name
FROM
    customer a
        JOIN
    invoice b ON a.customer_id = b.customer_id
        JOIN
    invoice_line c ON b.invoice_id = c.invoice_id
        JOIN
    track d ON c.track_id = d.track_id
        JOIN
    genre e ON d.genre_id = e.genre_id
WHERE
    e.name = 'Rock'
ORDER BY a.email; 

-- 2
SELECT 
    a.artist_id,
    a.name AS 'Artist name',
    COUNT(a.artist_id) AS 'Number of songs'
FROM
    artist a
        JOIN
    album2 b ON a.artist_id = b.artist_id
        JOIN
    track c ON b.album_id = c.album_id
        JOIN
    genre d ON c.genre_id = d.genre_id
WHERE
    d.name LIKE 'Rock'
GROUP BY a.artist_id , a.name
ORDER BY COUNT(a.artist_id) DESC
LIMIT 10;

-- 3
SELECT 
    AVG(milliseconds)
FROM
    track;
SELECT 
    name, milliseconds
FROM
    track
WHERE
    milliseconds > (SELECT 
            AVG(milliseconds) AS 'Average length'
        FROM
            track)
ORDER BY milliseconds DESC;