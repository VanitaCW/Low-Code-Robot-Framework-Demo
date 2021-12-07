*** Settings ***
Library     SeleniumLibrary

*** Keywords ***
Configure Chrome
    ${options} =    Evaluate    selenium.webdriver.ChromeOptions()
    Call Method     ${options}  add_argument    --incognito
    Call Method     ${options}  add_argument    --disable-notifications
    Create Webdriver    Chrome      chrome_options=${options}
