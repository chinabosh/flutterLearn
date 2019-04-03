import 'package:flutter/material.dart';
import 'package:flutter_app/view/fourth_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/view/third_page.dart';

//界面跳转
class SecondPage extends StatelessWidget {
  final text;

  SecondPage({Key key, @required this.text}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        body: new Center(
            child: new Column(
              children: <Widget>[
                new RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: new Text(text + "，点击返回"),
                ),
                new RaisedButton(onPressed: () {
                  Navigator.push(
                      context, new MaterialPageRoute(
                      builder: (context) => new ThirdPage()));
                },
                  child: new Text("前往第三个界面"),),
                new RaisedButton(onPressed: () {
                  Navigator.push(context, new MaterialPageRoute(
                      builder: (context) => new Fourth()));
                },
                  child: new Text("前往第四个界面"),)
              ],
            )
        )
    );
  }
}