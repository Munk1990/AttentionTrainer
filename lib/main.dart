import 'package:flutter/material.dart';
import 'list_cards_screen.dart';

void main() {
  runApp(const AttentionTrainerMain());
}

class AttentionTrainerMain extends StatelessWidget {
  const AttentionTrainerMain({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: ListCardsScreen(),
          ),
          
    );
  }
}



/// This is the stateless widget that the main application instantiates.
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child:  ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              onPrimary: Colors.white,
              shadowColor: Colors.greenAccent,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0)),
              minimumSize: Size(100, 40), //////// HERE
            ),
            onPressed: () {},
            child: Text('+'),
          ),
    );
  }}
