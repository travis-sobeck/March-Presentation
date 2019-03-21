$flowURI = '<flowURI>'
$body = @{
    authorizersEmails = 'tjsobeck@umn.edu'
    requester = "travis"
    requesterEmail = "nex916@gmail.com"
    replayJobID = "asdf"
    requesterMessage = "Your request is being worked on!"
    approvalMessage = "$($Inputs.requester) wants $($Inputs.'Pick one') and $($Inputs.'Pick many') and $($Inputs.'Pick from dropdown')"
    rbURI = 'webhookURI'
} | ConvertTo-Json



Invoke-WebRequest -Uri $flowURI -Body $body -Method Post -UseBasicParsing -ContentType 'application/json'

$uri = 'webhookURI'
$body = @{
    'requester' = 'nex916'
    'email' = 'nex916@gmail.com'
    'Timestamp' = '3/12/2019 17:15:50'
    'Email Address' = 'nex916@gmail.com'
    'Pick one' = 'Option 1'
    'Pick many' = 'CB1'
    'Pick from dropdown' = 'Dd1'
}

Invoke-WebRequest -uri $uri -body ($body | ConvertTo-Json) -Method Post -UseBasicParsing -ContentType 'application/json'
