import 'package:covid19/datasource.dart';
import 'package:covid19/localizations/localization_method.dart';
import 'package:covid19/localizations/set_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  static void setLocale(BuildContext context, Locale locale){
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);
  }
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Locale _locale;
  void setLocale(Locale locale){
    setState(() {
      _locale = locale;
    });
  }


  @override
  void didChangeDependencies() {
    getLocale().then((locale){
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if(_locale == null){
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: _locale,
        supportedLocales: [
          Locale('en','US'),
          Locale('ar','EG')
        ],
        theme: ThemeData(
          primaryColor: primaryblack,
        ),
        home: HomePage(),
        localizationsDelegates: [
          SetLocalization.localizationsDelegate,
        GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        localeResolutionCallback: (deviceLocale,supportedLocales){
          for(var locale in supportedLocales){
            if(locale.languageCode == deviceLocale.languageCode &&
            locale.countryCode == deviceLocale.countryCode){
              return deviceLocale;
            }
          }
          return supportedLocales.first;
        },
      );
    }
  }
}

