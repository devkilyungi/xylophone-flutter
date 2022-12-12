import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({key}) : super(key: key);

  void playSound(int noteNumber) async {
    final player = AudioPlayer();
    await player.play(AssetSource('note$noteNumber.wav'));
  }

  Widget buildNoteWidget({int noteNum, Color color}) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(color),
        ),
        onPressed: () {
          playSound(noteNum);
        },
        child: null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildNoteWidget(noteNum: 1, color: Colors.red),
              buildNoteWidget(noteNum: 2, color: Colors.green),
              buildNoteWidget(noteNum: 3, color: Colors.blue),
              buildNoteWidget(noteNum: 4, color: Colors.white),
              buildNoteWidget(noteNum: 5, color: Colors.orange),
              buildNoteWidget(noteNum: 6, color: Colors.purple),
              buildNoteWidget(noteNum: 7, color: Colors.yellow),
            ],
          ),
        ),
      ),
    );
  }
}
