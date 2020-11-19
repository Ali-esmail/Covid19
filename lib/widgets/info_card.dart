import 'package:covid19/localizations/localization_method.dart';
import 'package:covid19/widgets/line_chart.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final int effectednum;
  final Color iconcolor;
  final Function press;
  final Color Cardcolor;
  final Map historyData;

  const InfoCard({Key key, this.title, this.effectednum, this.iconcolor, this.press, this.Cardcolor, this.historyData}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constrains){
          return Container(
            margin: EdgeInsets.all(5),
            child: GestureDetector(
              onTap: press,
              child: Container(
                width: (MediaQuery.of(context).size.width/2)- 10,
                decoration: BoxDecoration(
                    color: Cardcolor,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.all(2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: iconcolor.withOpacity(0.12),
                                    shape: BoxShape.circle
                                  ),
                                  child: Image.asset(
                                      'images/OIP.jpg',
                                    height: 12,
                                    width: 12,
                                    color: Colors.white,
                                  ),
                            ),
                            Text(GetTranslated(context,title),
                            style: TextStyle(fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(5),
                               child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      color: Colors.blueGrey
                                    ),
                                    children:[
                                      TextSpan(
                                        text: '$effectednum \n',
                                        style: Theme.of(context).textTheme
                                            .headline.copyWith(fontWeight: FontWeight.bold)
                                      ),
                                      TextSpan(
                                        text: GetTranslated(context,'people'),
                                        style: TextStyle(
                                          fontSize: 15,
                                          height: 2
                                        )
                                      )
                                    ]
                                  ),
                                ),
                            ),
                            Expanded(
                                child: LineChartReport(
                                  historyData: historyData,
                                  title: this.title,
                                )
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}
