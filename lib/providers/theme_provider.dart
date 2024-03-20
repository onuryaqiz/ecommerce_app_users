import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  static const TTHEME_STATUS ="TTHEME_STATUS"; //Tema durumunu key olarak verdik.
  bool _darkTheme = false;
  bool get getIsDarkTheme => _darkTheme;

ThemeProvider(){
  getTheme(); //Burada da değişikliğin kalıcı olması için çağırdık.
}
  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance(); //Shared_Preferences paketini indirdik. Ve öyle kullandık.
    prefs.setBool(TTHEME_STATUS, value);
    _darkTheme = value; //Eğer getIsDarkTheme durumu neyse ona göre aksiyon almayı sağladık.
      notifyListeners(); //Uygulamaya değişiklik olduğunu bildiren function. Provider sayesinde değişiklikleri UI tarafına uygularız.
  }

  //Kullanıcı uygulamayı kapatıp açtığında önceki tema neyse onu tekrar almayı sağlayan fonksiyon.
  Future<bool> getTheme() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
   _darkTheme =  prefs.getBool(TTHEME_STATUS) ?? false; //Eğer null gelirse false'a eşitle.
   notifyListeners();
   return _darkTheme;
  }
}
