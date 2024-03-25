import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  TextEditingController _errors = TextEditingController();
  //functions
  Future<void> _signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );
      // Sign in success, mo balhin sa dashboard
      Navigator.pushReplacementNamed(context, '/dashboard');
    } on FirebaseAuthException catch (e) {
      _errors.text = '$e';
    } catch (e) {
      _errors.text = '$e';
    }
  }

  Future<void> _signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );
      _errors.text = 'SignedUp Successfully!';
    } on FirebaseAuthException catch (e) {
      _errors.text = '$e';
    } catch (e) {
      _errors.text = '$e';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Title bar
      appBar: AppBar(
        title: Text(
          'P-hub Login',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 248, 194, 19),
      ),
      body: SafeArea(
        //form
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //email textbox
            SizedBox(
              width: 500,
              height: 50,
              child: TextField(
                controller: _email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'email',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r'[^a-zA-Z0-9.@]')),
                ],
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
              ),
            ),

            //password textbox
            SizedBox(
              width: 500,
              height: 50,
              child: TextField(
                controller: _password,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'password',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
                textAlign: TextAlign.center,
              ),
            ),

            //buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //login
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.signIn,
                    size: 50.0,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    _signIn();
                  },
                ),
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.fileUpload,
                    size: 50.0,
                    color: Colors.orange,
                  ),
                  onPressed: () {
                    _signUp();
                  },
                ),
              ],
            ),

            //errors
            SizedBox(height: 8.0),
            TextField(
              controller: _errors,
              enabled: false,
              decoration: InputDecoration(
                labelText: 'Error',
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
