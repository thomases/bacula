-- list backup ast 24hrs that are successful but actualy backed up nothing.
-- these backups can be dangerous, as they seem to do what they should, but they
-- should be invstigated to see if there are conditions that bacula treats as OK but
-- that are in fact not OK

select client.name, job.name, job.starttime, job.endtime, job.jobstatus
from client, job
where  job.type = 'B' 
       and job.jobstatus = 'T'
       and job.jobbytes = 0
       and job.starttime >= now() - interval '{24} hours'
       and job.clientid = client.clientid;

