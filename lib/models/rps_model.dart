import 'package:rps/models/game_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RPSModel extends GameModel {
  @override
  List<String> choicesList = ['rock', 'paper', 'scissors'];

  @override
  String getDescription(String choice) {
    switch (choice) {
      case 'rock':
        return 'Rock crushes scissors, but gets covered by paper';
      case 'paper':
        return 'Paper covers rock, but gets cut by scissors';
      case 'scissors':
        return 'Scissors cuts paper, but gets crushed by rock';
    }
    return 'Description missing';
  }

  @override
  addGameToStats() {
    if (choice == answer) {
      gamesDraw++;
    } else if (choice == 'rock' && answer == 'scissors' ||
        choice == 'paper' && answer == 'rock' ||
        choice == 'scissors' && answer == 'paper') {
      gamesWon++;
    } else if (choice == 'rock' && answer == 'paper' ||
        choice == 'paper' && answer == 'scissors' ||
        choice == 'scissors' && answer == 'rock') {
      gamesLost++;
    }
  }

  @override
  Future updateSharedPrefrences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('RPStotalGamesWon', gamesWon);
    await prefs.setInt('RPStotalGamesLost', gamesLost);
    await prefs.setInt('RPStotalGamesDraw', gamesDraw);
  }

  @override
  Future syncDataWithProvider() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    gamesWon = prefs.getInt('RPStotalGamesWon') ?? 0;
    gamesLost = prefs.getInt('RPStotalGamesLost') ?? 0;
    gamesDraw = prefs.getInt('RPStotalGamesDraw') ?? 0;
  }
}
