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

  Future<String> createAlertDialog(BuildContext context) {
    TextEditingController customController = new TextEditingController();

    return showDialog(context: context, builder: (context) {
      return AlertDialog( 
      title: Text('Your Name'),
      content: TextField(
        controller: customController,
      ),
      actions: <Widget>[
        MaterialButton(
          elevation: 5.0,
          child: Text('Submit'),
          onPressed: () {
            Navigator.of(context).pop(customController.text.toString());
          },
        )
      ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Dialog')
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
              createAlertDialog(context).then((value){
                SnackBar mySnackbar = SnackBar(content: Text("Hello $value"),);
                Scaffold.of(context).showSnackBar(mySnackbar);
              });
            },
            child: Text('Alert', style: TextStyle(fontSize: 20.0),),
          ),
        ),
        );
      })
    );
  }
}
