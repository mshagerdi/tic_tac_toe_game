import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe_game/providers/game_data.dart';
import 'package:tic_tac_toe_game/utilities/constants.dart';

class ScoreBar extends StatelessWidget {
  const ScoreBar({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GameData>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Text('X score:', style: kScoreBarTitle),
            Text(
              provider.xScore.toString(),
              style: kScoreBarTitle.copyWith(
                color: Colors.green[900],
              ),
            ),
          ],
        ),
        Text(
          '${provider.xTurn ? 'X' : 'O'} Turn',
          style: kScoreBarTitle.copyWith(
            fontSize: 33,
            color: provider.xTurn ? Colors.green[900] : Colors.red[900],
          ),
        ),
        Column(
          children: [
            Text('O score:', style: kScoreBarTitle),
            Text(
              provider.oScore.toString(),
              style: kScoreBarTitle.copyWith(
                color: Colors.red[900],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
