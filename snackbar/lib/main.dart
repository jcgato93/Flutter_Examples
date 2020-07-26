import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snackbar')
      ),
      body: Builder(builder: (context){
        return Container(
        child: Center(
          child: FlatButton(
            padding: EdgeInsets.fromLTRB(20.0, 10.0 , 20.0 , 10.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
            color: Colors.deepOrange,
            textColor: Colors.white,
            onPressed: (){
              SnackBar mySnackbar = SnackBar(content: Text("Hi Snackbar!!"),);
              Scaffold.of(context).showSnackBar(mySnackbar);
            },
            child: Text('Snackbar', style: TextStyle(fontSize: 20.0),),
          ),
        ),
        );
      })
    );
  }
}
