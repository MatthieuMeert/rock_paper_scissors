import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rps/models/game_model.dart';
import 'package:rps/models/lizard_spok_model.dart';
import 'package:rps/models/rps_model.dart';

class GameViewModel with ChangeNotifier {
  GameModel gameModel = RPSModel();

  List<String> getChoicesList() => gameModel.choicesList;
  String? getChoice() => gameModel.choice;
  String? getAnswer() => gameModel.answer;
  int getGamesWon() => gameModel.gamesWon;
  int getGamesLost() => gameModel.gamesLost;

  GameViewModel() {
    initialState();
  }

  void initialState() {
    gameModel.syncDataWithProvider();
  }

  String getDescription(String choice) {
    return gameModel.getDescription(choice);
  }

  play(String choice) {
    setChoice(choice);
    generateRandomAnswer();
    gameModel.addGameToStats();
    gameModel.updateSharedPrefrences();
    notifyListeners();
  }

  setChoice(String type) {
    gameModel.choice = type;
    notifyListeners();
  }

  generateRandomAnswer() {
    gameModel.answer =
        gameModel.choicesList[Random().nextInt(gameModel.choicesList.length)];
  }

  changeGameModel() {
    gameModel is RPSModel
        ? gameModel = LizardSpokModel()
        : gameModel = RPSModel();
    gameModel.syncDataWithProvider();
    notifyListeners();
  }

  void reset() {
    gameModel.reset();
    notifyListeners();
  }
}
