import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe_game/providers/game_data.dart';

class PlaygroundButton extends StatelessWidget {
  final String? buttonLabel;
  final int? index;

  PlaygroundButton({this.buttonLabel, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      color: Colors.white,
      child: TextButton(
        onPressed: () {
          Provider.of<GameData>(
            context,
            listen: false,
          ).onButtonPressed(index!);
        },
        child: Text(
          buttonLabel!,
          style: TextStyle(
            fontSize: 44,
            fontWeight: FontWeight.bold,
            color: buttonLabel == 'X' ? Colors.green[800] : Colors.red[800],
          ),
        ),
      ),
    );
  }
}
