$url_swapi_people_one = "https://swapi.dev/api/people/1/"
$response = Invoke-WebRequest -Uri $url_swapi_people_one -Method "Get"
$responseContent = $response.Content
$responseStatus = $response.StatusCode

clear-host
$responseStatus
$responseContent= $responseContent | convertfrom-json
$responseContent.name

