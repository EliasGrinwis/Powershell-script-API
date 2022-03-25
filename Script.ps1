"
 hello Welcome to this Powershell script, 
 In this script I will ask you some questions. 
 Based on the questions you will get the data you need from Twitter HAVE FUN!
"

#Dit gaat de de ID van de user terug geven en de naam
$username = Read-Host "Give me your Twitter account and i will give you your Twitter ID"

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", "Bearer AAAAAAAAAAAAAAAAAAAAANELaAEAAAAANsF2y1aOzi1URzYP%2BlBEqm6SasI%3DDZAg2pzCdexxOaxfMhcw8cRRKimZVNlT0EVXaYp9VLBHzKZU0x")
$headers.Add("Cookie", "guest_id=v1%3A164788172340091642")

$response = Invoke-RestMethod "https://api.twitter.com/2/users/by/username/$username" -Method 'GET' -Headers $headers
$response | ConvertTo-Json
$response | ConvertTo-Html | Out-File C:\Users\Elias\Desktop\Project\IndexTest.html -Append -Encoding ascii

"
 Ok, so here you can find some information about
 your twitter account, you can also see your id.
 You need this id for the following question.
 "

 #Dit gaat de volgers van een bepaalde user weergeven
 $questionFollowers = Read-Host "Do you want to get a list of your followers? [yes | no]"
 if ($questionFollowers -eq "yes") {
    $followers = Read-Host "Give me your Twitter id and i will give you a list of your followers"

    $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
    $headers.Add("Authorization", "Bearer AAAAAAAAAAAAAAAAAAAAANELaAEAAAAANsF2y1aOzi1URzYP%2BlBEqm6SasI%3DDZAg2pzCdexxOaxfMhcw8cRRKimZVNlT0EVXaYp9VLBHzKZU0x")
    $headers.Add("Cookie", "ct0=c0b93a352b1ea4fa791226a333803a0b; guest_id=v1%3A164707946344757662")

    $responseFollowers = Invoke-RestMethod "https://api.twitter.com/2/users/$followers/followers" -Method 'GET' -Headers $headers
    $responseFollowers | ConvertTo-Json
    $responseFollowers | ConvertTo-Html | Out-File C:\Users\Elias\Desktop\Project\IndexTest.html -Append -Encoding ascii

"
 Ok so now you have a list of your followers but do you maybe
 want to make a tweet to your twitter account using a script?
 "
 } else { Write-Host "Ok, I have one more question"
 }

 $choice = Read-Host "Do you want to make a TWEET? [yes | no]"
 if ($choice -eq "yes") {
     $tweet = Read-Host "What do you want to TWEET?"
        $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
        $headers.Add("Authorization", "OAuth oauth_consumer_key=`"rpam0SB4T9eO92nKJ6PLCsAzp`",oauth_token=`"1488143836597657605-fMCqsqotB2hEgklYeJEbUyJXqoC4Sn`",oauth_signature_method=`"HMAC-SHA1`",oauth_timestamp=`"1648214851`",oauth_nonce=`"e7vsTkX0IGT`",oauth_version=`"1.0`",oauth_signature=`"WWvwurKRoW2w7BAbD4s5fbeUGJ0%3D`"")
        $headers.Add("Content-Type", "application/json")
        $headers.Add("Cookie", "guest_id=v1%3A164787151794347198")

        $body = "{`n    `"text`": `"$tweet`"`n}"

        $responseTweet = Invoke-RestMethod 'https://api.twitter.com/2/tweets' -Method 'POST' -Headers $headers -Body $body
        $responseTweet | ConvertTo-Json 
        $responseTweet | ConvertTo-Html | Out-File C:\Users\Elias\Desktop\Project\IndexTest.html -Append -Encoding ascii

 }  else {
     Write-host "
 Thankyou for doing my script. You can run this script everytime you want!!"
 }