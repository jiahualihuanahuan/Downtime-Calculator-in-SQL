# Downtime-Calculator-in-SQL
The most exciting data project I have worked on is the downtime analytics. On a production line, we installed several photo eyes to record data. For each photo eye, the SQL database insert a new row every time when photo eye was triggered (i.e. Not present = 0, present = 1). It record a unique index number, present or not, and a timestamp. To calculate total downtime, downtime period and more analytics, we developed this SQL query to record start of downtime, end of downtime, downtime period and downtime caused by which party (downstream or upstream) and more analytics.

It is a little tricky when you want to calculate downtime from a table with only timestamps, 0s and 1s. However, if you make a copy of the table (table a) and add 1 to the index in the new table (table b), then you compare the two tables by the same index. The difference in time would be the down time. If the time differnece is less than 300s, we consider that production line is running continously. On the other hand, if the time difference is greater than 300s, we will count it as downtime and print out in our summary as the SQL code printed out.


