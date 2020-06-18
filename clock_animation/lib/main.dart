import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clock animation',      
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  Animation animation;
  AnimationController animationController;

  @override
  void initState() { 
    super.initState();

    animationController = AnimationController(
      vsync: this, 
      duration: Duration(seconds: 5)
    );
    
    animationController.addListener(() { 
      if(animationController.isCompleted) {
        animationController.reverse();
      } else if (animationController.isDismissed) {
        animationController.forward();
      }

       setState((){

       });
    });

    // start animation
    animationController.forward();
  }

  _currentTime() {
    return "${DateTime.now().hour} : ${DateTime.now().minute}";
  }

  @override
  Widget build(BuildContext context) {

    animation = CurvedAnimation(parent: animationController, curve: Curves.easeInOut);

    animation = Tween(begin: -0.5, end: 0.5).animate(animation);



    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("Clock")
          ),
          backgroundColor: Colors.deepOrange,
          elevation: 0.0,
      ),
      body: Container(
        color: Colors.deepOrange,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Material(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  color: Colors.brown.shade900,
                  elevation: 10.0,
                  child: Container(
                    width: 320,
                    height: 320,
                    child: Center(
                      child: Text(_currentTime(),style: TextStyle(
                        fontSize: 70.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),
                ),

                Transform(
                    alignment: FractionalOffset(0.5, 0.0),
                    transform: Matrix4.rotationZ(animation.value),

                    child: Container(                  
                      child: Image.asset('assets/images/pendulo.png', width: 200,)
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
