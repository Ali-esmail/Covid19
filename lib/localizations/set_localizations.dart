import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SetLocalization{
  final Locale locale;

  SetLocalization(this.locale);

  static SetLocalization of(BuildContext context){
    return Localizations.of<SetLocalization>(context, SetLocalization);
  }

  static const LocalizationsDelegate<SetLocalization> localizationsDelegate= _GetLocalizationDelegate();

  Map <String,String> _localizedvalues;
  Future load() async{
    String jsonStringValues = await rootBundle.loadString('langs/${locale.languageCode}.json');
    Map<String,dynamic> mappedjson = json.decode(jsonStringValues);
    _localizedvalues = mappedjson.map((key, value) => MapEntry(key, value.toString()));
  }

  String getTranslateValue(String key){
   return _localizedvalues[key];
  }

  String getCurrentCode(){
    return locale.languageCode;
  }
}

class _GetLocalizationDelegate extends LocalizationsDelegate<SetLocalization>{
  const _GetLocalizationDelegate();
  
  @override
  bool isSupported(Locale locale) {
return ["en","ar"].contains(locale.languageCode);
  }

  @override
  Future<SetLocalization> load(Locale locale) async {
SetLocalization lacalization = new SetLocalization(locale);
await lacalization.load();
return lacalization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<SetLocalization> old) {
return false;
  }

}