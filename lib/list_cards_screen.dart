import 'package:flutter/material.dart';

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
        itemCount: image.length,
        itemBuilder: (BuildContext context, int index) {
          return card(image[index], title[index], context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Code to execute
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
  return Card(
    color: Colors.yellow[50],
    elevation: 8.0,
    margin: EdgeInsets.all(4.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Image.network(
            image,
            height: MediaQuery.of(context).size.width * (3 / 4),
            width: MediaQuery.of(context).size.width,
          ),
        ),
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