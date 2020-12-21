clear-host

# Import poison module
Import-Module -Name "$(get-location)\poison.ps1" -Force

# Create a new custom object

# Basic Blocks
$object_one = new-poshobject
add-elementtoposhobject -object $object_one -fieldname "Name" -value "Stuart"
add-elementtoposhobject -object $object_one -fieldname "Age" -value 52
add-elementtoposhobject -object $object_one -fieldname "Mobile" -value "07988004884"


# Add an array of email address strings
$email_addresses = @("name@hotmail.co.uk", "name@googlemail.com")
add-elementtoposhobject -object $object_one -fieldname "EmailAddresses" -value $email_addresses


# Add an array of address strings
$address = new-poshobject
add-elementtoposhobject -object $address -fieldname "AddressLineOne" -value "Address line 1"
add-elementtoposhobject -object $address -fieldname "AddressLineTwo" -value "line 2"
add-elementtoposhobject -object $address -fieldname "AddressLineThree" -value "line 3"
add-elementtoposhobject -object $address -fieldname "AddressLineFour" -value "line 4"
add-elementtoposhobject -object $object_one -fieldname "Address" -value $address


# Add an array of skills objects
$skill_one = new-poshobject
add-elementtoposhobject -object $skill_one -fieldname "Powershell" -value "Amazing"

$skill_two = new-poshobject
add-elementtoposhobject -object $skill_two -fieldname "Python" -value "Brilliant

$skill_three = new-poshobject
add-elementtoposhobject -object $skill_three -fieldname "Java" -value "Superb"

add-elementtoposhobject -object $object_one -fieldname "skills" -value @($skill_one, $skill_two, $skill_three)


$j1 = jsonify-poshobject -object $object_one
"----------------------------"
$j1
