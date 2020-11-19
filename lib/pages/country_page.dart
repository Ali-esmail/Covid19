import 'dart:convert';
import 'dart:math';
import 'package:covid19/widgets/info_card.dart';
import 'package:covid19/localizations/localization_method.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class CountryState extends StatefulWidget {
  @override
  _CountryStateState createState() => _CountryStateState();
}

class _CountryStateState extends State<CountryState> {
  List countriesData;

   fetchcountriesData() async {
    http.Response responce = await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      countriesData= json.decode(responce.body);
      }
    );
  }

  int x = 0;
  int loop(){
      x++;
      return x;
    }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchcountriesData();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 6,
        title: Text('${GetTranslated(context,'Countries_Status')}'
        ),
      ),
      body:countriesData == null ? Center(
          child: CircularProgressIndicator()
      )
          :
      ListView.builder(
          itemCount: countriesData == null ? 0 : countriesData.length,
          itemBuilder: (context,index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 90,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.grey[100],
                        offset: Offset(0, 10),
                        blurRadius: 10
                    ),
                  ]
              ),
              child: Row(
                children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('${loop()}',
                          style:TextStyle(
                            fontSize: 25,
                            color: Colors.blue[600]
                          ) ,
                        ),
                      ],
                    ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(countriesData[index]['country'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Image.network(
                          countriesData[index]['countryInfo']['flag'],
                          height: 60,
                          width: 60,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Text('Confirmed : ' +
                                  countriesData[index]['cases'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text('Active : ' +
                                  countriesData[index]['active'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text('Recoverd : '+
                                  countriesData[index]['recovered']
                                      .toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrange
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text('Deathes : '+
                                  countriesData[index]['deaths'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[800]
                              ),
                            ),
                          ],
                        ),
                      )
                  )
                ],
              ),
            );
          }
      )
                    );
    }
  }
