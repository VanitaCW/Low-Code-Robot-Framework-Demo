*** Settings ***
Library     SeleniumLibrary
Library     Collections
Library     ../Libraries/SelectSuggestion.py
Variables   ../Variables/ItemList.py

*** Variables ***
${locator}
*** Keywords ***
Get Items
    ${keys}     Get Dictionary Keys     ${ITEMS}    sort_keys=False
    ${values}   Get Dictionary Values   ${ITEMS}    sort_keys=False
    ${length}   Get Length      ${keys}


    FOR     ${index}    IN RANGE   0   ${length}
        ${ingredient}   Get From List   ${keys}     ${index}
        ${locators}     Get From List   ${values}   ${index}
        ${search_elem}  Get From List   ${locators}     0
        ${item_elem}    Get From List   ${locators}     1
        ${pickup_elem}  Get From List   ${locators}     2
        Input Text      css:#search     ${ingredient}
        Press Keys   None    ENTER
        Sleep   3s
        Select Item     ${search_elem}
        Sleep   3s
        Wait Until Element Is Visible      //label[@for='checkboxOrderPickupFacet']//div[@class='styles__CheckboxVisual-sc-1v63imw-5 gxIeGa']
        IF  ${index} == 0
            Click Element    css:label[for='checkboxOrderPickupFacet'] div[class='styles__CheckboxVisual-sc-1v63imw-5 gxIeGa']
        END
        Sleep   3s
        Scroll Element Into View    ${pickup_elem}
        Click Button      ${pickup_elem}
        Sleep   3s
        Click Button     //button[normalize-space()='Continue shopping']
        Click Element   css:#search
        Click Element   //span[@class='sc-gsTCUz ghTyzu']//div[@class='sc-hKgILt gTLZXx']//*[name()='svg']
        Sleep   2s
    END
Checkout
    Click Element       css:use
    Sleep   2s
    Click Button        css:.BaseButton-sc-3v3oog-0.ButtonPrimary-sc-9wgfzx-0.gxYtIT.hcoLgH
    Sleep   2s
    Location Should Contain     PRECHECKOUT


