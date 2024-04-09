#
# HELLDIVERS! Use this script to check in on active campaigns.
#

# Call the REST API  
$apiUrl = https://helldiverstrainingmanual.com/api/v1/war/campaign  
$response = Invoke-RestMethod -Uri $apiUrl -Method Get  

 

# Filter for planets that need immediate MANAGED DEMOCRACY
$defensePlanets = $response | Where-Object {$_.defense -eq $true}  

 

# Display the planets that need immediate MANAGED DEMOCRACY
write-host "HELLDIVERS! We must defened these planets NOW!" -ForegroundColor Yellow

foreach($planet in $defensePlanets){  

    Write-Host "Planet: $($planet.name)"  
    Write-Host "Faction: $($planet.faction)"
    Write-Host "Defense $($planet.defense)"
    Write-Host "Percent Liberated $($planet.percentage)"  
    Write-Host "-----------------------------"  

}  

 

# Filter for planets that are not marked for defense
$otherPlanets = $response | Where-Object {$_.defense -eq $false}

# Display planets that are not marked for defense
write-host "Other planets in need of Managed Democracy!" -ForegroundColor Yellow

foreach($planet in $otherPlanets){  

    Write-Host "Planet: $($planet.name)"  
    Write-Host "Faction: $($planet.faction)"
    Write-Host "Defense $($planet.defense)"
    Write-Host "Percent Liberated $($planet.percentage)"  
    Write-Host "-----------------------------"  

}