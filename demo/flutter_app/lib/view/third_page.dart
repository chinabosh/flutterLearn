import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ThirdState();
  }
}

class ThirdState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new RaisedButton(onPressed: (){
        Navigator.pop(context);
      },
        child: new Text("返回"),
      ),
    );
  }

}