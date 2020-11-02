import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'main.dart';
import 'login_page.dart';
import 'signup.dart';

/*
  Login or Signup Widget to be used when logged out of the app.
  This widget will contain two buttons with the option to either login or signup.
*/
class Home extends StatelessWidget {
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Service App"),
          backgroundColor: Colors.blue,
          centerTitle: true),
      body: Column(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.all(100.0),
          ),

          // Login Button
          Center(
              child: RaisedButton(
                elevation: 5.0,
                color: Colors.white,
                onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text('Log In',
                  style: TextStyle(
                  fontFamily: 'san-serif',
                  color: Colors.lightBlue,
                  ),
                ),
              )
          ),

          // Signup Button
          Center(
            child: RaisedButton(
                elevation: 5.0,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp()));
                },
                child: Text('Sign up',
                  style: TextStyle(
                    fontFamily: 'san-serif',
                    color: Colors.white,
                  ),
                ),
                color: Colors.lightBlue),
          ),
        ],
      ),
    );
  }
}
