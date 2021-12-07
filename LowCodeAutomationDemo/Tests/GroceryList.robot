*** Settings ***
Resource    ../Resources/Common.robot
Resource    ../Resources/SetLocation.robot
Resource    ../Resources/Shopping.robot

Suite Setup     Begin Web Test
Suite Teardown  End Web Test

*** Variables ***
${BROWSER}      chrome
${URL}    https://www.target.com/


*** Tasks ***
Set Location
    Select Location
Start Shopping
    Get Items
Shopping Done
    Checkout