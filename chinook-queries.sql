
/*1.Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.*/
SELECT  FirstName||" "|| LastName AS 'Full Name', CustomerId,Country FROM Customer WHERE Country <> "USA"

/*2.Provide a query only showing the Customers from Brazil.*/
SELECT * FROM Customer WHERE Country = "Brazil"

/*3.Provide a query showing the Invoices of customers who are from Brazil.
The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.*/
SELECT FirstName||" " || LastName AS 'Full name',Invoice.InvoiceId , Invoice.InvoiceDate,Invoice.BillingCountry
FROM Customer
JOIN Invoice ON Invoice.CustomerId = Customer.CustomerId
WHERE Country = "Brazil"

/*4.Provide a query showing only the Employees who are Sales Agents.*/
SELECT * FROM Employee WHERE Title LIKE '%Agent%'

/*5.Provide a query showing a unique list of billing countries from the Invoice table.*/
SELECT BillingCountry FROM Invoice

/*6.Provide a query showing the invoices of customers who are from Brazil.*/
SELECT * FROM Invoice WHERE BillingCountry = "Brazil"

/*7.Provide a query that shows the invoices associated with each sales agent.
 The resultant table should include the Sales Agent's full name.*/
SELECT *,Employee.Title FROM Invoice
JOIN Customer ON Customer.CustomerId = Invoice.CustomerId
JOIN Employee ON Employee.EmployeeId = Customer.SupportRepId
WHERE Employee.Title LIKE '%Agent%'

/*8.Provide a query that shows the Invoice Total, Customer name,
 Country and Sale Agent name for all invoices and customers.*/
 SELECT Invoice.Total,Customer.FirstName|| " "||Customer.LastName AS 'Customer name',
 Customer.Country,Employee.FirstName|| " "||Employee.LastName AS 'Sales Person' FROM Invoice
 LEFT JOIN Customer ON Customer.CustomerId = Invoice.CustomerId
 LEFT JOIN Employee ON Employee.EmployeeId = Customer.SupportRepId
 WHERE Employee.Title LIKE '%Agent%'

 /*9.How many Invoices were there in 2009 and 2011? What are the respective total sales for each of those years?*/
SELECT COUNT(*) FROM Invoice
 WHERE InvoiceDate >= '2009/01/01' and InvoiceDate <'2011/12/30'

 /*10.Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.
*/
SELECT COUNT(*) FROM InvoiceLine WHERE InvoiceId = 37

/*11.Looking at the InvoiceLine table,
provide a query that COUNTs the number of line items for each Invoice. HINT: GROUP BY*/
SELECT InvoiceId,COUNT(InvoiceLineId) FROM InvoiceLine GROUP BY InvoiceId

/*12.Provide a query that includes the track name with each invoice line item.*/
SELECT Track.Name,InvoiceLineId FROM InvoiceLine
JOIN Track ON Track.TrackId = InvoiceLine.TrackId
WHERE Track.TrackId = InvoiceLine.TrackId

/*13.Provide a query that includes the purchased track name AND artist name with each invoice line item.*/
SELECT Track.Name, Artist.Name FROM InvoiceLine
JOIN Track ON InvoiceLine.TrackId = Track.TrackId
JOIN Album ON Album.AlbumId = Track.AlbumId
JOIN Artist ON Artist.ArtistId = Album.ArtistId

/*14.Provide a query that shows the # of invoices per country. HINT: GROUP BY*/
SELECT COUNT(InvoiceId),BillingCountry FROM Invoice GROUP BY BillingCountry

/*15.Provide a query that shows the total number of tracks in each playlist.
 The Playlist name should be include on the resultant table.*/
SELECT Playlist.Name,COUNT(Track.TrackId) FROM Playlist
JOIN PlaylistTrack ON PlaylistTrack.PlaylistId = Playlist.PlaylistId
JOIN Track ON Track.TrackId = PlaylistTrack.TrackId
GROUP BY Playlist.Name

/*16.Provide a query that shows all the Tracks, but displays no IDs.
The resultant table should include the Album name, Media type and Genre.*/
SELECT Album.Title,MediaType.Name,Genre.Name FROM Track
JOIN Album ON Album.AlbumId = Track.TrackId
JOIN MediaType ON MediaType.MediaTypeId = Track.MediaTypeId
JOIN Genre ON Genre.GenreId = Track.GenreId

/*17.Provide a query that shows all Invoices but includes the # of invoice line items.*/
