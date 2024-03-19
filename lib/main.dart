import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/components/playground.dart';
import 'package:tic_tac_toe_game/components/score_bar.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe_game/providers/game_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GameData(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Tic Tac Toe'),
      // ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ScoreBar(),
            Playground(),
            ElevatedButton(
              onPressed: () {
                Provider.of<GameData>(context, listen: false).resetGame();
              },
              child: Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
