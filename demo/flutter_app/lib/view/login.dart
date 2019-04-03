import 'package:flutter/material.dart';
import 'package:flutter_app/utils/md5_utils.dart';
import 'package:flutter_app/utils/net_utils.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }

}

class LoginState extends State<Login> {

  final pwdControl = TextEditingController();
  final usernameControl = TextEditingController();
  var username,pwd;

  Widget _getInput(name, hint, isPwd, controller, imagePath){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text(name),
        ),
        new Expanded(
            child: new TextField(
              decoration: new InputDecoration(
                  hintText: hint,
              ),
              obscureText: isPwd,//是否密码
              maxLines: 1,
              controller: controller,
            )
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(imagePath),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,//副轴居中
          mainAxisAlignment: MainAxisAlignment.center,//主轴居中
          children: <Widget>[
            _getInput("账号", "请输入账号", false, usernameControl, 'images/ic_count.png'),
            _getInput("密码", "请输入密码", true, pwdControl, 'images/ic_count.png'),
            Container(
              alignment: Alignment.center,
              child: RaisedButton(
                  onPressed: () async {
                    username = '${usernameControl.text}';
                    pwd = '${pwdControl.text}';
                    print('username:$username,pwd:$pwd');
                    //TODO do login
                    const _url = "";
                    final _params = {'userName':username, 'userPwd':Md5Utils.toMd5(pwd)};
                    print(_params);
                    try {
                      var response = await NetUtils.post(_url, params: _params);
                      print(response);
                      print(response['rows']);
                    }catch(e){

                    }
              },
              child: Text('登录'),
              color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }

}