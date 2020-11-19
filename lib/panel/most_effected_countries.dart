import 'package:flutter/material.dart';

class MostEffectedPanel extends StatelessWidget {
  final List mosteffectCountries;

  const MostEffectedPanel({Key key, this.mosteffectCountries}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context,index){
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 2),
              child: Row(
                children: <Widget>[
                  Image.network
                    (mosteffectCountries[index]['countryInfo']['flag'],
                  height: 35
                  ),
                  Text(' : ',style: TextStyle(fontSize: 30)),
                  Text(mosteffectCountries[index]['country'],
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(' : ',style: TextStyle(fontSize: 30)),
                  Text(mosteffectCountries[index]['deaths'].toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,fontSize: 35
                    ),
                  ),
                ],
              ),
            );
          },
        itemCount: 5,
      ),
    );
  }
}
