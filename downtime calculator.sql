# Table Name: PE09 (photo eye number 9)
# Columns Names: index, 009_Line_2_Infeed_Full, timestamp
# The PE09 sensor insert a new row of data every time when sensor was triggered i.e. nothing = 0, case present = 1
# it record a unique index number in index column ascendingly, 0 or 1 in 009_Line_2_Infeed_Full column, and a timestamp of current time

# To calculate total downtime, downtime period and so on, we developed this SQL query to record start of downtime, end of downtime, downtime period and downtime caused by which party (down stream or up stream)

SELECT b.timestamp AS Down_Begin, a.timestamp AS Down_End, timestampdiff(minute, b.timestamp, a.timestamp) AS Down_Period_min, REPLACE(REPLACE(b.009_Line_2_Infeed_Full, 0, 'FCB;), 1, 'ROBOT') AS Caused_by
FROM PE09 AS a JOIN PE09 AS b ON a.index = b.index-1
WHERE b.timestamp > (SELECT subdate(curdate(), date_formate(),'%w')-1) AND timestampdiff(second, b.timestamp, a.timestampdiff) > 200


select b.t_stamp Down_begin, a.t_stamp Down_end, timestampdiff(minute, b.t_stamp, a.t_stamp) Down_Time_minute, REPLACE(REPLACE(b.009_Line_2_Infeed_Full,0,'FCB'),1,'ROBOT') AS Caused_by
from pe09 a join pe09 b
where b.t_stamp > (select subdate(curdate(),date_format(curdate(),'%w')-1)) and a.pe09_ndx=b.pe09_ndx+1 and  timestampdiff(second, b.t_stamp, a.t_stamp)>200;
