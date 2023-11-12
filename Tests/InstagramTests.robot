*** Settings ***
Library   SeleniumLibrary
Resource  ../pages/InstagramPage.robot



Test Setup     Instagram anasayfasına git



*** Test Cases ***
Başarılı instagram sayfası testi
      Instagram giriş sayfasina başarı ile bağlandığını dogrula
      Kullanıcı adını ve şifreyi gir
      Anasaya başarılı bir şekilde bağlandığını dogrula



Instagram'a geçersiz şifreyle giriş
    Geçersiz şifreyi gir
    Hata mesajını dogrula

Instagram'a geçersiz kullanıcı adı ile giriş
   Geçersiz kullanıcı adı gir
   Hata mesajını dogrula


Boş bir kullanıcı adı ve şifreyle giriş yap
  Instagram giriş sayfasina başarı ile bağlandığını dogrula
  Kullanıcı adı ve şifre alanlarını boş bırakın ve kontrol edin
