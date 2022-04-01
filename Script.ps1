"
 hello Welcome to this Powershell script, 
 In this script I will ask you some questions. 
 Based on the questions you will get the data you need from Twitter HAVE FUN!
"

#Dit gaat de de ID van de user terug geven en de naam
$username = Read-Host "Give me your Twitter account and I will give you your Twitter ID"

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", "Bearer $baererToken")
$headers.Add("Cookie", "guest_id=v1%3A164788172340091642")

$response = Invoke-RestMethod "https://api.twitter.com/2/users/by/username/$username" -Method 'GET' -Headers $headers
$response | ConvertTo-Json
$response | ConvertTo-csv | Out-File C:\Users\Elias\Desktop\Project\script.csv -Append -Encoding ascii


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
    $headers.Add("Authorization", "Bearer $baererToken")
    $headers.Add("Cookie", "ct0=c0b93a352b1ea4fa791226a333803a0b; guest_id=v1%3A164707946344757662")

    $responseFollowers = Invoke-RestMethod "https://api.twitter.com/2/users/$followers/followers" -Method 'GET' -Headers $headers
    $responseFollowers | ConvertTo-Json
    $responseFollowers | ConvertTo-Csv | Out-File C:\Users\Elias\Desktop\Project\script.csv -Append -Encoding ascii

"
 Ok so now you have a list of your followers but do you maybe
 want to make a tweet to your twitter account using a script?
 "
 } else { "No list" | Out-File C:\Users\Elias\Desktop\Project\script.csv -Append -Encoding ascii
     Write-Host "Ok, I have one more question" 
 }

 $choice = Read-Host "Do you want to make a TWEET? [yes | no]"
 if ($choice -eq "yes") {
     $tweet = Read-Host "What do you want to TWEET?"
     $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
     $headers.Add("Authorization", "OAuth oauth_consumer_key=`"$consumerKey`",oauth_token=`"1488143836597657605-fMCqsqotB2hEgklYeJEbUyJXqoC4Sn`",oauth_signature_method=`"HMAC-SHA1`",oauth_timestamp=`"1648643735`",oauth_nonce=`"rckAc9CHM92`",oauth_version=`"1.0`",oauth_signature=`"rz2JPmxX%2FQZarcKYm230wsMttCU%3D`"")
     $headers.Add("Content-Type", "application/json")
     $headers.Add("Cookie", "guest_id=v1%3A164787151794347198")
     
     $body = "{`n    `"text`": `"$tweet`"`n}"
     
     $responseTweet = Invoke-RestMethod 'https://api.twitter.com/2/tweets' -Method 'POST' -Headers $headers -Body $body
     $responseTweet | ConvertTo-Json
    $responseTweet | ConvertTo-csv | Out-File C:\Users\Elias\Desktop\Project\script.csv -Append -Encoding ascii

 }  else {
     "No Tweet" | Out-File C:\Users\Elias\Desktop\Project\script.csv -Append -Encoding ascii
 }

 $clearContent = Read-Host "Ok so now I asked you 3 questions but do you want to clear the csv file? [yes | no]"
 if ($clearContent -eq "yes") {
     clear-Content "C:\Users\Elias\Desktop\Project\script.csv"
     Write-Host "Your csv file is now cleared"
 } 


 "Thankyou for doing my script. You can run this script everytime you want!!"
