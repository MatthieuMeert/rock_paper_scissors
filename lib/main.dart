import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rps/view_models/game_view_model.dart';
import 'package:rps/views/game_view.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => GameViewModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RPS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GameView(),
    );
  }
}
