*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}      Chrome
${url_google}   http://www.google.com
${test_fb}      Facebook
${user_fb}      xxxx
${pass_fb}      xxxx
${name}         xxxx


*** Test Cases ***
Search Facebook from Google
    Open Google
    Search Facebook
  
Log in on Facebook
    Insert user and password
    Click login btn
    Check User
    End


*** Keywords ***
Open Google
    Open Browser  ${url_google}   ${browser}

Search Facebook
    Input Text    name=q    ${test_fb}
    Wait Until Element Is Visible    name=btnK
    Click Element    name=btnK
    Wait Until Page Contains    ${test_fb}
    Click Link    https://th-th.facebook.com/

Insert user and password
    Input Text    name=email    ${user_fb} 
    Input Text    name=pass    ${pass_fb}

Click login btn
    Click Element    name=login

Check User
    Wait Until Page Contains    ${name}    10

End
    Close Browser