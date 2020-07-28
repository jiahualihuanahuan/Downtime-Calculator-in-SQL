# Downtime-Calculator-in-SQL
The most exciting data project I have worked on is the downtime analytics. On a production line, we installed several photo eyes to record data. For each photo eye, the SQL database insert a new row every time when photo eye was triggered (i.e. Not present = 0, present = 1). It record a unique index number, present or not, and a timestamp. To calculate total downtime, downtime period and more analytics, we developed this SQL query to record start of downtime, end of downtime, downtime period and downtime caused by which party (downstream or upstream) and more analytics.
