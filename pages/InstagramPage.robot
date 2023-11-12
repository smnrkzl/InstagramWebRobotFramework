**** Settings   ***
Library   SeleniumLibrary
Variables  ../keywords/Data.py
Variables  ../locaters/Locators.py


*** Keywords ***
Instagram anasayfasına git
    Open Browser    ${Datas.UrlInsta}   chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    10s


Instagram giriş sayfasina başarı ile bağlandığını dogrula
    ${actualFacebookBaglanText}    Get Text    ${InsLocators.btnFacebook}
    Should Be Equal   ${actualFacebookBaglanText}     ${Datas.ExpectedBtnFacebookText}
    Title Should Be    ${Datas.TitleBaglanti}


Kullanıcı adını ve şifreyi gir
    Input Text    ${InsLocators.inputUsername}    ${Datas.Email}
       Input Text    ${InsLocators.inputPassword}    ${Datas.Password}
       Sleep    2s
       Click Element    ${InsLocators.btnGirisYap}


Anasaya başarılı bir şekilde bağlandığını dogrula
   Wait Until Page Contains    Instagram


Geçersiz şifreyi gir
    Input Text    ${InsLocators.inputUsername}    ${Datas.Email}
    Input Text    ${InsLocators.inputPassword}    ${Datas.InvalidPassword}
    Sleep    2s
    Click Element    ${InsLocators.btnGirisYap}


Hata mesajını dogrula
  ${SifreHataMesaji}    Get Text      ${InsLocators.HataMesaji}
  Should Be Equal      ${SifreHataMesaji}    ${Datas.expectedHataMesajiYanlisSifre}

Geçersiz kullanıcı adı gir
    Input Text    ${InsLocators.inputUsername}    ${Datas.InvalidEmail}
    Input Text    ${InsLocators.inputPassword}    ${Datas.Password}
    Sleep    2s
    Click Element    ${InsLocators.btnGirisYap}


Kullanıcı adı ve şifre alanlarını boş bırakın ve kontrol edin
    ${inputUsername}    Get Text    ${InsLocators.inputUsername}
    Should Be Empty    ${inputUsername}

    ${inputPassword}   Get Text   ${InsLocators.inputPassword}
    Should Be Empty     ${inputPassword}

    ${is_disabled} =  Element Should Be Disabled    ${InsLocators.btnGirisYap}
     Run Keyword If    '${is_disabled}' == 'True'    Log     Öğe devre dışıdır