"hello Welcome to this Powershell script, 
In this script i will ask you some questions. 
Based on the questions you will get the data you need from Twitter"
"HAVE FUN!"

#Dit gaat de de ID van de user terug geven en de naam
$username = Read-Host "Give me your Twitter account and i will give you your Twitter ID"

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", "Bearer AAAAAAAAAAAAAAAAAAAAANELaAEAAAAANsF2y1aOzi1URzYP%2BlBEqm6SasI%3DDZAg2pzCdexxOaxfMhcw8cRRKimZVNlT0EVXaYp9VLBHzKZU0x")
$headers.Add("Cookie", "ct0=c0b93a352b1ea4fa791226a333803a0b; guest_id=v1%3A164707946344757662")

$response = Invoke-RestMethod "https://api.twitter.com/2/users/by/username/$username" -Method 'GET' -Headers $headers
$response | ConvertTo-Json


"
Ok, so here you can find some information about
your twitter account, you can also see your id.
You need this id for the following question
"

#Dit gaat de volgers van een bepaalde user weergeven
$followers = Read-Host "Give me your Twitter id and i will give you a list of your followers"

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", "Bearer AAAAAAAAAAAAAAAAAAAAANELaAEAAAAANsF2y1aOzi1URzYP%2BlBEqm6SasI%3DDZAg2pzCdexxOaxfMhcw8cRRKimZVNlT0EVXaYp9VLBHzKZU0x")
$headers.Add("Cookie", "ct0=c0b93a352b1ea4fa791226a333803a0b; guest_id=v1%3A164707946344757662")

$response = Invoke-RestMethod "https://api.twitter.com/2/users/$followers/followers" -Method 'GET' -Headers $headers
$response | ConvertTo-Json


"
Ok so now you have a list of your followers but do you maybe
want to make a tweet to your twitter account using a script?
"


#hier ga we de user vrage wat hij wil tweeten op zijn account
$choice = Read-Host "Do you want to make a TWEET?".ToLower()
if ($choice -eq "yes") {
    $tweet = Read-Host "What do you want to TWEET?"

    $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
    $headers.Add("Authorization", "OAuth oauth_consumer_key=`"rpam0SB4T9eO92nKJ6PLCsAzp`",oauth_token=`"1488143836597657605-fMCqsqotB2hEgklYeJEbUyJXqoC4Sn`",oauth_signature_method=`"HMAC-SHA1`",oauth_timestamp=`"1647105056`",oauth_nonce=`"nFJUmrDIpyW`",oauth_version=`"1.0`",oauth_body_hash=`"XSWk1lAQos1%2FLnojme%2Fn7PNdpUw%3D`",oauth_signature=`"i19Vgdd%2FYL9R8DSXrzwvt8SJv1I%3D`"")
    $headers.Add("Content-Type", "application/json")
    $headers.Add("Cookie", "ct0=c0b93a352b1ea4fa791226a333803a0b; guest_id=v1%3A164707946344757662")

    $body = "{`n    `"text`": `"$tweet`"`n}"

    $response = Invoke-RestMethod 'https://api.twitter.com/2/tweets' -Method 'POST' -Headers $headers -Body $body
    $response | ConvertTo-Json
}  else {
    Write-host "Ok thank you for doing this script"
}
