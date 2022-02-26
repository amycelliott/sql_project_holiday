/* GENERAL NOTES
 * Table Notes.  ID fields are the unique ID for those tables.
 * People Table requires data in the Name field, but the “Location” could have null values.
 * Seceret_Santa_Selection Table requires data in all fields, the table was (or would be) set up to not allow null values in any of the 4 fields.
 * Wish_List table requires data in the Person_ID and Gift_Idea.  The “Notes” field could have null values.
 */

/* Question 1: 
 * Write an SQL Statement that shows the Year, Giver_ID, and Receiver_ID
 */

    /*
     * Note: I added the Order By Year descending to put the most recent year on top.  
     * The ID fields don’t mean much, so I did not add any additional filtering.  
     * I also added the alias of “s” so I didn’t have to re-type the table name again.
     */

    select 
      s.year
      ,s.giver_id
      ,s.receiver_id
    from secret_santa_selection s
    order by s.year desc
    ;


/* Question 2: 
 * Take the SQL Written above and create a unique count of how many Givers and Receivers there are by Year
 */

    /*
     * Note: I just added in the Group by Year and did a distinct count, this will get the unique count.  
     * If someone is listed twice they should only be counted once per year.  I also gave the count distinct fields an alias.
     */

    select 
      s.year
      ,count(distinct s.giver_id) as distinct_givers
      ,count(distinct s.receiver_id) as distinct_receivers
    from secret_santa_selection s
    group by s.year
    order by s.year desc
    ;


/* Question 3: 
 * Write an SQL Statement that shows the Year, Giver_ID, GIver Name, and Giver Location for the year 2021
 */

    /*
     * Note: You could do this with either an Inner Join putting the Year Clause in the inner join, or use a left join and where clause.  
     * For what we are looking at doing, the inner join would work well because if the selection process has started for that year, 
     * then there will be a giver ID as that field can never be null along with the year field.  If there is data for the year 2021, 
     * then the giver_id will join on the people table. 

     * For the inner join, adding the s.year = ‘2021’ in the On statement will improve performance as it will limit the number of records 
     * it tries to join on for any future joins.
     */

    select 
      s.year
      ,s.giver_id
      ,g.name as giver_name
      ,g.location as giver_location
    from secret_santa_selection s
    left join people g on (s.giver_id = g.id)
    where s.year = ‘2021’
    order by s.year desc, g.name
    ;

    /* ********* OR ********** */

    select 
      s.year
      ,s.giver_id
      ,g.name as giver_name
      ,g.location as giver_location
    from secret_santa_selection s
    inner join people g on (s.giver_id = g.id and s.year = ‘2021’)
    order by s.year desc, g.name
    ;


/* Question 4: 
 * Add to the query above to now include the same fields and include the Reveiver_ID, Receiver Name, and Receiver Location.
 */

    /* 
     * Note: You could do either an inner or left join.  If you do a left join in the previous question you would still have the where clause.  
     * For joining to get the Receiver information, this could be a left or an inner join.  I did inner join because based on the data diagram 
     * and table requirements we know there can’t be null values.
     */

    select 
      s.year
      ,s.giver_id
      ,g.name as giver_name
      ,g.location as giver_location
      ,s.receiver_id
      ,r.name as receiver_name
      ,r.location as receiver_location
    from secret_santa_selection s
    inner join people g on (s.giver_id = g.id and s.year = ‘2021’)
    inner join people r on (s.receiver_id = r.id)
    order by s.year desc, g.name, r.name
    ;


/* Question 5: 
 * Take the above query and add to it the Gift_Idea field.
 * Hint - when joining, who is creating the “wish list”?  The Giver or the Receiver? 
 */

    /*
     * Note: I used a left join because there is nothing stating that there will always be a wish list entry for every year for every receiver.  
     * In the On clause, we also need to join on both the ID of the Receiver and the Year.
     */

    select 
      s.year
      ,s.giver_id
      ,g.name as giver_name
      ,g.location as giver_location
      ,s.receiver_id
      ,r.name as receiver_name
      ,r.location as receiver_location
      ,w.gift_idea
    from secret_santa_selection s
    inner join people g on (s.giver_id = g.id and s.year = ‘2021’)
    inner join people r on (s.receiver_id = r.id)
    left join wish_list w on (s.receiver_id = w.person_id and s.year = w.year)
    order by s.year desc, g.name, r.name
    ;



/* Additional Questions you could answer */
/* Question 6: 
 * What are the top 5 Gifts of all time?
 */

    /* 
     * Notes: Order by the count of the person_ID, make sure to do descending so you get the highest values first.
     */

    select 
      w.gift_idea
      ,count(w.person_id) as num_people
    from wish_list w
    group by w.gift_idea
    order by count(w.person_id) desc
    limit 5
    ;

    /* Or … Depending on the SQL version this would also work The below will not work in MySQL, but I put this here to show the differences between some SQL. */

    select top 5
      w.gift_idea
      ,count(w.person_id) as num_people
    from wish_list w
    group by w.gift_idea
    order by count(w.person_id) desc
    ;


/* Question 7: 
 * What are the top Gifts per year? For each gift, How many people are asking for it by Year?
 */

    select 
      w.gift_idea
      ,w.year
      ,count(w.person_id) as num_people
    from wish_list w
    group by w.gift_idea, w.year
    order by w.year, count(w.person_id) desc
    ;


/* Question 8: 
 * How many unique gifts are on the wish list by year?  
 */

    select 
      w.year
      ,count(distinct  w.gift_idea) as unique_gift_ideas
    from wish_list w
    group by w.year
    order by w.year
    ;


/* Question 9: 
 * How can you validate that the Giver and Receiver ID’s are in the People table?


    select 
      s.*
    from secret_santa_selection s
    left join people g on (s.giver_id = g.id)
    left join people r on (s.receiver_id = r.id)
    where (g.id is null or r.id is null)
    ;


/* Question 10: 
 * How Many people do not have something added to the Wish List?
 * Hint: You can use a previous query and just add a where clause
 */

    select 
      s.year
      ,s.giver_id
      ,g.name as giver_name
      ,g.location as giver_location
      ,s.receiver_id
      ,r.name as receiver_name
      ,r.location as receiver_location
      ,w.gift_idea
    from secret_santa_selection s
    inner join people g on (s.giver_id = g.id and s.year = ‘2021’)
    inner join people r on (s.receiver_id = r.id)
    left join wish_list w on (s.receiver_id = w.person_id and s.year = w.year)
    where w.id is null
    order by s.year desc, g.name, r.name
    ;

