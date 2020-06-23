import 'package:flutter/material.dart';
import 'package:routes_and_navigation/DetailNote.dart';
import 'package:routes_and_navigation/Utils/Notes.dart';

 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomeScreen()
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Note> _notes;

  _HomeScreenState() {
    _notes = Notes.initializeNotes().getNotes;
  }

  _handleIconDisplay(int index) {
    bool readStatus = _notes[index].getReadState;
    return Icon((readStatus ? Icons.check_circle : Icons.remove_circle), color: (readStatus) ? Colors.grey : Colors.red,);
  }

  _handleDetailedViewData(int index) async {
    bool data = await Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailedNote(_notes[index])));
    this.setState((){
      _notes[index].setReadState = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      appBar:  AppBar(
        title: Text("Notes"),
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView.builder(
        itemCount: _notes.length,
        itemBuilder: (context, index) {      
        return Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400, width: 1.0))
          ),
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(_notes[index].getTitle),
                _handleIconDisplay(index)
              ],
            ),
            onTap: (){  
             _handleDetailedViewData(index);
            },
          ),
        );
      }),
    );
  }
}