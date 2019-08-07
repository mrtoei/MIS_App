import 'package:flutter/material.dart';

void main() => runApp(Auth());

class Auth extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AuthState();
  }
}

class AuthState extends State<Auth>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return Scaffold(
        appBar: AppBar(
          title: Text('MIS'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
                child:Column(

                  children: <Widget>[
                   Padding(
                     padding:const EdgeInsets.only(left:30,right:30),
                     child:  TextFormField(
                       decoration: InputDecoration(
                           labelText: 'Username'
                       ),
                     ),
                   ), Padding(
                      padding:const EdgeInsets.only(left:30,right:30),
                      child:  TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Password'
                        ),
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      color:Colors.blueAccent ,
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    )
                  ],
                )
            )
          ],
        )
      );
  }
}
