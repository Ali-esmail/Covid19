import 'package:flutter/material.dart';
import 'package:covid19/localizations/set_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

String GetTranslated(BuildContext context, String key){
  return SetLocalization.of(context).getTranslateValue(key);
}
String getLangCode(BuildContext context){
  return SetLocalization.of(context).getCurrentCode();
}

const String ENGLISH = "en";
const String ARABIC = "ar";
const String LANG_CODE = "LANG_CODE";

Future<Locale> setLocale(String languageCode) async{
  SharedPreferences _preferences= await SharedPreferences.getInstance();
  await _preferences.setString(LANG_CODE,languageCode);
  return _locale(languageCode);
}

Locale _locale(String langcode) {
  Locale _temp;
  switch(langcode){
    case ENGLISH :
      _temp = Locale(langcode,"US");
      break;
    case ARABIC :
      _temp = Locale(langcode,"EG");
      break;
    default :
      _temp = Locale(ENGLISH,"US");
      break;
  }
  return _temp;
  }

  Future<Locale> getLocale() async{
    SharedPreferences _preferences= await SharedPreferences.getInstance();
    String languagecode = _preferences.getString(LANG_CODE)?? ENGLISH;
    return _locale(languagecode);
}
