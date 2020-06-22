import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomeScreen()
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer Example"),
        backgroundColor: Colors.deepOrange,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: <Color>[
                  Colors.deepOrange,
                  Colors.orangeAccent
                ])
              ),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(60.0)),
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/images/flutter-logo.png",width: 80, height: 80,),
                      ),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Flutter Drawer", style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),),
                      )
                  ],
                ),
              )
            ),
            CustomListTile(onTap: (){},icon: Icons.person, text: "Profile"),
            CustomListTile(onTap: (){},icon: Icons.notifications, text: "Notifications"),
            CustomListTile(onTap: (){},icon: Icons.settings, text: "Settings"),
            CustomListTile(onTap: (){},icon: Icons.close, text: "Logout"),
          ],
        ),
      ),
    );
  }
}


class CustomListTile extends StatelessWidget {
  
  IconData icon;
  String text;
  Function onTap;

  CustomListTile({Key key, this.icon, this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade400))
        ),
        child: InkWell(
          onTap: this.onTap,
          splashColor: Colors.orangeAccent,
          child: Container(
            height: 50,
            child: Row(          
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[          
                Row(                
                  children: <Widget>[
                    Icon(this.icon),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(this.text, style: TextStyle(
                        fontSize: 16.0
                      ),),
                    ),
                  ],
                ),          
                Icon(Icons.arrow_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}