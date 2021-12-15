/* GENERAL NOTES
 * Table Notes.  ID fields are the unique ID for those tables.
 * People Table requires data in the Name field, but the “Location” could have null values.
 * Seceret_Santa_Selection Table requires data in all fields, the table was (or would be) set up to not allow null values in any of the 4 fields.
 * Wish_List table requires data in the Person_ID and Gift_Idea.  The “Notes” field could have null values.
 */

/* Question 1: 
 * Write an SQL Statement that shows the Year, Giver_ID, and Receiver_ID
 */



/* Question 2: 
 * Take the SQL Written above and create a unique count of how many Givers and Receivers there are by Year
 */



/* Question 3: 
 * Write an SQL Statement that shows the Year, Giver_ID, GIver Name, and Giver Location for the year 2021
 */



/* Question 4: 
 * Add to the query above to now include the same fields and include the Reveiver_ID, Receiver Name, and Receiver Location.
 */



/* Question 5: 
 * Take the above query and add to it the Gift_Idea field.
 * Hint - when joining, who is creating the “wish list”?  The Giver or the Receiver? 
 */



/* Additional Questions you could answer */
/* Question 6: 
 * What are the top 5 Gifts of all time?
 */


/* Question 7: 
 * What are the top Gifts per year? For each gift, How many people are asking for it by Year?
 */


/* Question 8: 
 * How many unique gifts are on the wish list by year?  
 */



/* Question 9: 
 * How can you validate that the Giver and Receiver ID’s are in the People table?



/* Question 10: 
 * How Many people do not have something added to the Wish List?
 * Hint: You can use a previous query and just add a where clause
 */


