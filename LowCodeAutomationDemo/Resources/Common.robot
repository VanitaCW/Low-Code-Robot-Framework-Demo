*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/ChromeOptions.robot

*** Keywords ***
Begin Web Test
    Configure Chrome
    Go To  ${URL}
    Maximize Browser Window

End Web Test
    Close Browser
