# Table Name: PE09 (photo eye number 9)
# Columns Names: index, 009_Line_2_Infeed_Full, timestamp
# The PE09 sensor insert a new row of data every time when sensor was triggered i.e. nothing = 0, case present = 1
# it record a unique index number in index column ascendingly, 0 or 1 in 009_Line_2_Infeed_Full column, and a timestamp of current time

# To calculate total downtime, downtime period and so on, we developed this SQL query to record start of downtime, end of downtime, downtime period and downtime caused by which party (down stream or up stream)


# Juice Line Downtime Summary
SELECT b.t_stamp Down_begin, a.t_stamp Down_end, timestampdiff(minute, b.t_stamp, a.t_stamp) Down_Time_minute, REPLACE(REPLACE(b.009_Line_2_Infeed_Full,0,'FCB'),1,'ROBOT') AS Caused_by
FROM pe09 a JOIN pe09 b
WHERE b.t_stamp > (select subdate(curdate(),date_format(curdate(),'%w')-1)) AND a.pe09_ndx=b.pe09_ndx+1 AND timestampdiff(second, b.t_stamp, a.t_stamp)>300;

# Soy Line Downtime Summary
SELECT b.t_stamp Down_begin, a.t_stamp Down_end, timestampdiff(minute, b.t_stamp, a.t_stamp) Down_Time_minute, REPLACE(REPLACE(b.006_Line_1_Infeed_Full,0,'FCB'),1,'ROBOT') AS Caused_by
FROM pe06 a JOIN pe06 b
WHERE b.t_stamp > (select subdate(curdate(),date_format(curdate(),'%w')-1)) AND a.pe06_ndx=b.pe06_ndx+1 AND timestampdiff(second, b.t_stamp, a.t_stamp)>300;
