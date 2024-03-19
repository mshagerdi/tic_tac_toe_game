import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe_game/providers/game_data.dart';
import 'package:tic_tac_toe_game/widgets/playground_buttons.dart';

class Playground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GameData>(context);
    List<PlaygroundButton> buttonsList = [];

    List<PlaygroundButton> getButtonsList() {
      for (int i = 0; i < provider.gameStatusList.length; i++) {
        buttonsList.add(PlaygroundButton(
          buttonLabel: provider.gameStatusList[i],
          index: i,
        ));
      }
      return buttonsList;
    }

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(colors: [
            Colors.black,
            Colors.white,
          ], radius: 0.44, focal: Alignment.center),
        ),
        child: Center(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            padding: EdgeInsets.all(9),
            childAspectRatio: 1,
            children: getButtonsList(),
          ),
        ),
      ),
    );
  }
}
