import 'package:covid19/datasource.dart';
import 'package:covid19/localizations/localization_method.dart';
import 'package:covid19/pages/faqs.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FAQpage()
                  )
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              color: primaryblack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('${GetTranslated(context,'FAQS')}',
                    style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                  ),
                  Icon(Icons.arrow_forward,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              launch('https://www.who.int/indonesia/news/novel-coronavirus/mythbusters');
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              color: primaryblack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('${GetTranslated(context,'MYTH_BUSTERS')}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                  ),
                  Icon(Icons.arrow_forward,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              launch('https://covid19responsefund.org/en/');
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              color: primaryblack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('${GetTranslated(context,'DONATE')}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                  ),
                  Icon(Icons.arrow_forward,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
