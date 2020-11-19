import 'dart:convert';
import 'package:covid19/datasource.dart';
import 'package:covid19/localizations/models.dart';
import 'package:covid19/main.dart';
import 'package:covid19/pages/country_page.dart';
import 'package:covid19/panel/info_panel.dart';
import 'package:covid19/panel/most_effected_countries.dart';
import 'package:covid19/panel/world_wide_panel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'localizations/localization_method.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map worldData;
  fetchworldwideData() async {
    http.Response responce = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData= json.decode(responce.body);
    });
}

Map historyData;
 fetchHistoryData()async{
    http.Response response = await http.get('https://corona.lmao.ninja/v2/historical/all');
    setState(() {
      historyData = json.decode(response.body);
    });
}

List countriesData;
  fetchcountriesData() async {
    http.Response responce = await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      countriesData= json.decode(responce.body);
    });
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchworldwideData();
    fetchcountriesData();
    fetchHistoryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title:Text('${GetTranslated(context,'Covid_19_Panel')}') ,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.all(8),
            child: DropdownButton(
              underline: SizedBox(),
              icon: Icon(
                  Icons.language,
                color: Colors.white,
              ),
              items: Language.LanguageList().map<DropdownMenuItem<Language>>
                ((lang) => DropdownMenuItem(
                value: (lang),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      lang.flag,
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(lang.name)
                  ],
                ),
            ),
            ).toList(),
              onChanged: (Language lang)async{
                _changeLanguage(lang);
              },
          )
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              height: 100,
              color: Colors.orange[100],
              child: Text(
                  getLangCode(context) == ARABIC ? DataSource.quotear : DataSource.quote,
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('${GetTranslated(context,'WorldWide')}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CountryState()
                          )
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        color: primaryblack
                      ),
                      child: Text('${GetTranslated(context,'Regional')}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ),
            worldData == null ? CircularProgressIndicator : WorldWidePanel(
             worldwide: worldData,
              historyData: historyData,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text('${GetTranslated(context,'Most_Effected_Countries')}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                ),
              ),
            ),
            countriesData == null ? CircularProgressIndicator() :MostEffectedPanel
              (mosteffectCountries: countriesData),
            SizedBox(height: 20,),
            InfoPanel(),
            SizedBox(height: 15),
            Center(
              child: Text('${GetTranslated(context,'WE_ARE_TOGETHER_IN_THIS :')}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: primaryblack
              ),
              ),
            ),
            SizedBox(height: 40,)
          ],
        ),
      ),
    );
  }

  void _changeLanguage(Language lang) async{
    Locale _temp = await setLocale(lang.lanuagecode);
    MyApp.setLocale(context, _temp);
  }
}
