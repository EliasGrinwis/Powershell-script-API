"hello Welcome to this Powershell script, 
In this script i will ask you some questions. 
Based on the questions you will get the data you need from Twitter"
"HAVE FUN!"

#Dit gaat de de ID van de user terug geven en de naam
$username = Read-Host "Give me your Twitter account and i will give you your Twitter ID"

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", "Bearer AAAAAAAAAAAAAAAAAAAAANELaAEAAAAANsF2y1aOzi1URzYP%2BlBEqm6SasI%3DDZAg2pzCdexxOaxfMhcw8cRRKimZVNlT0EVXaYp9VLBHzKZU0x")
$headers.Add("Cookie", "ct0=c0b93a352b1ea4fa791226a333803a0b; guest_id=v1%3A164707946344757662")

$responseUsername = Invoke-RestMethod "https://api.twitter.com/2/users/by/username/$username" -Method 'GET' -Headers $headers
$responseUsername | ConvertTo-Json
$responseUsername | ConvertTo-Html | Out-File -Append -FilePath C:\Users\Elias\Desktop\Project\index.html | Format-Table -AutoSize -Property Name, Dependant

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

$responseFollowers = Invoke-RestMethod "https://api.twitter.com/2/users/$followers/followers" -Method 'GET' -Headers $headers
$responseFollowers | ConvertTo-Json
$responseFollowers | ConvertTo-Html | Out-File -Append -FilePath C:\Users\Elias\Desktop\Project\index.html | Format-Table -AutoSize -Property Name, Dependant


"
Ok so now you have a list of your followers but do you maybe
want to make a tweet to your twitter account using a script?
"


#hier ga we de user vrage wat hij wil tweeten op zijn account
$choice = Read-Host "Do you want to make a TWEET? [yes | no]".ToLower()
if ($choice -eq "yes") {
    $tweet = Read-Host "What do you want to TWEET?"

    $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
    $headers.Add("Authorization", "OAuth oauth_consumer_key=`"rpam0SB4T9eO92nKJ6PLCsAzp`",oauth_token=`"1488143836597657605-fMCqsqotB2hEgklYeJEbUyJXqoC4Sn`",oauth_signature_method=`"HMAC-SHA1`",oauth_timestamp=`"1647254999`",oauth_nonce=`"eu65a7psChV`",oauth_version=`"1.0`",oauth_signature=`"GUmHCSeceFEn6LBEwr4B1I54iSc%3D`"")
    $headers.Add("Content-Type", "application/json")
    $headers.Add("Cookie", "guest_id=v1%3A164707946344757662")

    $body = "{`n    `"text`": `"$tweet`"`n}"

    $responseTweet = Invoke-RestMethod 'https://api.twitter.com/2/tweets' -Method 'POST' -Headers $headers -Body $body
    $responseTweet | ConvertTo-Json
    $responseTweet | ConvertTo-Html | Out-File -Append -FilePath C:\Users\Elias\Desktop\Project\index.html | Format-Table -Property Name, Dependant

}  else {
    Write-host "Ok thank, now i have one more question"
}

$CLearContent = Read-Host "Do you want to clear the HTML file? [yes | no]".ToLower()
if ($CLearContent -eq "yes") {
    Clear-Content "C:\Users\Elias\Desktop\Project\index.html"
    Write-Host "Ok all your information in your HTML file is deleted"
} else {
    Write-host "Ok thank you for doing this script, you can find all your
information in the HTML file. Everytime you do this script again the
information will be added to the index file."
}
