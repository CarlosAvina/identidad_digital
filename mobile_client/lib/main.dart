import 'dart:core' as prefix0;
import 'dart:core';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      color: Colors.blueAccent,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/f_logo_RGB-Blue_144.png', width: 100),
              SizedBox(height: 120),
              Text(
                'Inicia sesión',
                style: TextStyle(
                    color: Color(0xff0089FA),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(height: 5),
              ButtonTheme(
                height: 50,
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Color(0xff0089FA),
                  child: Text(
                    'Certificado de identidad',
                    style: TextStyle(fontSize: 15),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30),
                  ),
                  elevation: 15,
                  onPressed: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: const Text('Dialog title'),
                            content: Text('Sample alert'),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('Cancel'),
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                              ),
                              FlatButton(
                                child: Text('OK'),
                                onPressed: () => Navigator.pop(context, 'OK'),
                              ),
                            ],
                          ),
                    ).then<String>((returnVal) {
                      if (returnVal != null) {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('You clicked: $returnVal'),
                          action: SnackBarAction(label: 'OK', onPressed: () {}),
                        ));
                      }
                    });
                  },
                ),
              ),
              PasswordField(
                hintText: 'NIP',
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
  });

  final Key fieldKey;
  final String hintText;
  final String labelText;
  final String helperText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;

  @override
  _PasswordFieldState createState() => new _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return new TextFormField(
      key: widget.fieldKey,
      obscureText: _obscureText,
      maxLength: 4,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: new InputDecoration(
          border: const UnderlineInputBorder(),
          filled: true,
          hintText: widget.hintText,
          labelText: widget.labelText,
          helperText: widget.helperText,
          suffixIcon: new GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: new Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off),
          )),
    );
  }
}
