import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:rps/models/game_model.dart';

class GameViewModel with ChangeNotifier {
  var gameModel = GameModel();

  List<String> getChoicesList() => gameModel.choicesList;
  String? getChoice() => gameModel.choice;
  String? getAnswer() => gameModel.answer;

  setChoice(String type) {
    gameModel.choice = type;
    notifyListeners();
  }

  generateRandomAnswer() {
    gameModel.answer =
        gameModel.choicesList[Random().nextInt(gameModel.choicesList.length)];
  }
}
