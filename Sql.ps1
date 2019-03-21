## Example code to create a database to store automation jobs
Import-Module SqlServer  #powersehll gallery
$sqlServer = 'sql-server.your.org'
$sqlInstance = Get-SqlInstance -ServerInstance $sqlServer

#region Virt_automation_tracking
    $db = 'automation_tracking'
    $query = "create table automationJobs (
        jobs nvarchar(max),
        jobID AS JSON_VALUE(jobs, '$.jobID'),
        index ix_jobID (jobID)
    );
    ALTER TABLE automationJobs
        ADD CONSTRAINT [jobs  should be formatted as JSON]
        CHECK (ISJSON(jobs)=1)"
    Invoke-Sqlcmd -Query $query -Database $db -ServerInstance $sqlInstance
#endregion