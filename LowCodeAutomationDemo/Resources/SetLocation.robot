*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/ChromeOptions.robot

*** Variables ***
${zipcode}       77054

*** Keywords ***
Select Location
    Click Element   //div[@class='h-text-bold h-text-md']
    Wait Until Element Is Visible       //input[@id='zipOrCityState']
    Input Text     //input[@id='zipOrCityState']    ${zipcode}
    Click Button   //button[normalize-space()='Lookup']
    Wait Until Element Is Visible   css:button[aria-label='Set Houston South Main as my store']
    Click Button   css:button[aria-label='Set Houston South Main as my store']


