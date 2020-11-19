import 'package:covid19/localizations/localization_method.dart';
import 'package:covid19/widgets/info_card.dart';
import 'package:flutter/material.dart';

class WorldWidePanel extends StatelessWidget {
  final Map worldwide ;
  final Map historyData;

  const WorldWidePanel({Key key, this.worldwide, this.historyData}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2
          ),
        children: <Widget>[
          InfoCard(
            title: 'Confirmed',
            iconcolor: Colors.red,
            effectednum: worldwide["cases"],
            press: (){},
            Cardcolor:Colors.red[100] ,
            historyData: historyData,
          ),
          InfoCard(
            title:'Active',
            iconcolor: Colors.green,
            effectednum: worldwide['active'],
            press: (){},
            Cardcolor: Colors.green[100],
            historyData: null,
          ),
          InfoCard(
            title:'Recoverd',
            iconcolor: Colors.grey,
            effectednum: worldwide["recovered"],
            press: (){},
              Cardcolor: Colors.grey[400],
            historyData: historyData,
          ),
          InfoCard(
            title:'Deathes',
            iconcolor: Colors.yellow,
            effectednum: worldwide['deaths'],
            press: (){},
            Cardcolor: Colors.yellow[400],
            historyData: historyData,
          )
        ],
      ),
    );
  }
}
class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color txtColor;
  final String title;
  final String count;

  const StatusPanel({Key key, this.panelColor, this.txtColor, this.title, this.count}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(10),
      color: panelColor,
      height: 80,
      width: width / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(title,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              color: txtColor
            ),
          ),
          SizedBox(height: 15,),
          Text(count,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              color: txtColor
            ),
          )
        ],
      ),
    );
  }
}

