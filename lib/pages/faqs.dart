import 'package:covid19/localizations/localization_method.dart';
import 'package:flutter/material.dart';

import '../datasource.dart';

class FAQpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${GetTranslated(context,'Question_About_Covid_19')}',
        )
      ),
      body: ListView.builder(
        itemCount: DataSource.questionAnswers.length,
          itemBuilder: (context,index){
            return ExpansionTile(
              title: Text(
                getLangCode(context) == ARABIC ? DataSource.questionAnswersar[index]['question'] :
                DataSource.questionAnswers[index]['question'] ,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              children: <Widget>[
                Padding(padding: EdgeInsets.all(12)),
                Text(getLangCode(context) == ARABIC ? DataSource.questionAnswersar[index]['answer'] :
                DataSource.questionAnswers[index]['answer'] ,
                  style: TextStyle(
                    color: Colors.red
                  ),
                )
              ],
            );
          }
      ),
    );
  }
}
