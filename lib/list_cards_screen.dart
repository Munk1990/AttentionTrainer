import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

int counter = 1;

String timerRawFile = '''
{
  "array": [
    {
      "name":"Work",
      "target_minutes": 200
    },{
      "name":"Study",
      "target_minutes": 200
    },{
      "name":"Play",
      "target_minutes": 200
    }
  ]
}
''';

String timerRawFile2 = '''
{
      "name":"Work",
      "target_minutes": 200
    }
''';

Map<String, dynamic> time_trackers = jsonDecode(timerRawFile);
Map<String, dynamic> time_trackers_2 = jsonDecode(timerRawFile2);


class ListCardsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>  _ListCardsScreenState();
}


class _ListCardsScreenState extends State<ListCardsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Focus Targets"),
      ),
      body: ListView.builder(
        itemCount: counter,
        itemBuilder: (BuildContext context, int index) {
          return card(image[index], title[index], context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter = counter;
          });
          showDialog(context: context, builder: (BuildContext context){
            return new_focus_dialog();
          });
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 3,
        child: BottomNavigationBar(items: [
            BottomNavigationBarItem(icon: const Icon(Icons.menu), label: 'menuNavBar'),
            BottomNavigationBarItem(icon: const Icon(Icons.report), label: 'searchNavBar'),
          ],)
      ),
    );
  }

}


Widget card(String image, String title, BuildContext context) {
  print(time_trackers);
  print(time_trackers.entries);
  print(time_trackers_2['name']);
  return Card(
    color: Colors.yellow[50],
    elevation: 8.0,
    margin: EdgeInsets.all(4.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: Column(
      children: [
       
        Text(
          title,
          style: TextStyle(
            fontSize: 38.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
  );
}

List<String> image = [
  'https://cdn.pixabay.com/photo/2021/06/01/07/03/sparrow-6300790_960_720.jpg',
  'https://cdn.pixabay.com/photo/2017/10/20/10/58/elephant-2870777_960_720.jpg',
  'https://cdn.pixabay.com/photo/2014/09/08/17/32/humming-bird-439364_960_720.jpg','https://cdn.pixabay.com/photo/2018/05/03/22/34/lion-3372720_960_720.jpg'];
List<String> title = ['Sparrow', 'Elephant', 'Humming Bird', 'Lion'];


class new_focus_dialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new_focus_dialog_state();
  }

}

class new_focus_dialog_state extends State<new_focus_dialog> {
  int _current_hour = 0;
  int _current_minute = 0;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(children: <Widget>[
      const TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Focus Area',
        ),
      ),
      Text("Target hours"),
      Row(children: [
        Expanded(
            child: Column(
              children: [
                      Text("Hours"),

            NumberPicker(
          minValue: 0,
          maxValue: 23,
          value: _current_hour,
          onChanged: (value) => setState(() {
            _current_hour = value;
          }),
        ),
        ]
        )),
        Expanded(
          child: Column(
            children: [
              Text("Minutes"),
              NumberPicker(
          minValue: 0,
          maxValue: 55,
          step: 5,
          value: _current_minute,
          onChanged: (value) => setState(() {
            print(_current_minute);
            _current_minute = value;
          }),
        )]),
    )]),
    ElevatedButton(
      onPressed: () => {}, 
      child: const Text("+") 
      )
    ]);
  }
}


