import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/utilities/constants.dart';

class GameData extends ChangeNotifier {
  bool _xTurn = false;
  bool _isFinished = false;
  List<String> _winnersList = [];
  List<String> _gameStatusList = ['', '', '', '', '', '', '', '', ''];

  List<String> get gameStatusList {
    return _gameStatusList;
  }

  bool get xTurn {
    return _xTurn;
  }

  int get xScore {
    return 'X'.allMatches(_winnersList.toString()).length;
  }

  int get oScore {
    return 'O'.allMatches(_winnersList.toString()).length;
  }

  void resetGame() {
    _gameStatusList = ['', '', '', '', '', '', '', '', ''];
    _winnersList = [];
    _isFinished = false;
    notifyListeners();
  }

  void onButtonPressed(int index) {
    if (_gameStatusList[index] == '') {
      _gameStatusList[index] = _xTurn ? 'X' : 'O';
      checkWinner();
      _xTurn = !_xTurn;

      notifyListeners();
    }
    if (_isFinished || !_gameStatusList.contains('')) {
      _gameStatusList = ['', '', '', '', '', '', '', '', ''];
      _isFinished = false;
    }

    print('game status: $_gameStatusList');
  }

  void checkWinner() {
    if ((_gameStatusList[0] != '' &&
            _gameStatusList[0] == _gameStatusList[1] &&
            _gameStatusList[1] == _gameStatusList[2]) ||
        (_gameStatusList[3] != '' &&
            _gameStatusList[3] == _gameStatusList[4] &&
            _gameStatusList[4] == _gameStatusList[5]) ||
        (_gameStatusList[6] != '' &&
            _gameStatusList[6] == _gameStatusList[7] &&
            _gameStatusList[7] == _gameStatusList[8]) ||
        (_gameStatusList[0] != '' &&
            _gameStatusList[0] == _gameStatusList[3] &&
            _gameStatusList[3] == _gameStatusList[6]) ||
        (_gameStatusList[1] != '' &&
            _gameStatusList[1] == _gameStatusList[4] &&
            _gameStatusList[4] == _gameStatusList[7]) ||
        (_gameStatusList[2] != '' &&
            _gameStatusList[2] == _gameStatusList[5] &&
            _gameStatusList[5] == _gameStatusList[8]) ||
        (_gameStatusList[0] != '' &&
            _gameStatusList[0] == _gameStatusList[4] &&
            _gameStatusList[4] == _gameStatusList[8]) ||
        (_gameStatusList[2] != '' &&
            _gameStatusList[2] == _gameStatusList[4] &&
            _gameStatusList[4] == _gameStatusList[6])) {
      _winnersList.add(_xTurn ? 'X' : 'O');
      print('WinnerList is $_winnersList');
      _isFinished = true;
      notifyListeners();
    }
  }
}
