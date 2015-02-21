-- Put this in your query.sql to select it from the query menu in
-- bconsole

* Enter time range in hours: 
select client.name, job.name, job.starttime, job.endtime, job.jobstatus
from client, job
where  job.type = 'B' 
       and job.jobstatus = 'T'
       and job.jobbytes = 0
       and job.starttime >= now() - interval '{%1} hours'
       and job.clientid = client.clientid;
