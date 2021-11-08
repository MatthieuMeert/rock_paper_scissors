import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rps/models/lizard_spok_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rps/models/rps_model.dart';

class GameViewModel with ChangeNotifier {
  var gameModel = LizardSpokModel();

  List<String> getChoicesList() => gameModel.choicesList;
  String? getChoice() => gameModel.choice;
  String? getAnswer() => gameModel.answer;
  int getGamesWon() => gameModel.gamesWon;
  int getGamesLost() => gameModel.gamesLost;

  GameViewModel() {
    initialState();
  }

  void initialState() {
    syncDataWithProvider();
  }

  play(String choice) {
    setChoice(choice);
    generateRandomAnswer();
    gameModel.addGameToStats();
    updateSharedPrefrences();
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

  Future updateSharedPrefrences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('totalGamesWon', gameModel.gamesWon);
    await prefs.setInt('totalGamesLost', gameModel.gamesLost);
    await prefs.setInt('totalGamesDraw', gameModel.gamesDraw);
  }

  Future syncDataWithProvider() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    gameModel.gamesWon = prefs.getInt('totalGamesWon') ?? 0;
    gameModel.gamesLost = prefs.getInt('totalGamesLost') ?? 0;
    gameModel.gamesDraw = prefs.getInt('totalGamesDraw') ?? 0;
    notifyListeners();
  }
}
