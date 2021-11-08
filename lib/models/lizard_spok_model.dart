import 'package:rps/models/game_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LizardSpokModel extends GameModel{
  @override
  List<String> choicesList = ['rock', 'paper', 'scissors', 'lizard', 'spok'];

  @override
  addGameToStats() {
    if (choice == answer) {
      gamesDraw++;
    } else if (choice == 'rock' && (answer == 'scissors' || answer == 'lizard') ||
        choice == 'paper' && (answer == 'rock' || answer == 'spok') ||
        choice == 'scissors' && (answer == 'paper' || answer == 'lizard') ||
        choice == 'lizard' && (answer == 'paper' || answer == 'spok') ||
        choice == 'spok' && (answer == 'rock' || answer == 'scissors')) {
      gamesWon++;
    } else if (choice == 'rock' && (answer == 'paper' || answer == 'spok') ||
        choice == 'paper' && (answer == 'scissors' || answer == 'lizard') ||
        choice == 'scissors' && (answer == 'rock' || answer == 'spok') ||
        choice == 'lizard' && (answer == 'rock' || answer == 'scissors') ||
        choice == 'spok' && (answer == 'paper' || answer == 'lizard')) {
      gamesLost++;
    }
  }

  @override
  Future updateSharedPrefrences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('LizardSpokTotalGamesWon', gamesWon);
    await prefs.setInt('LizardSpokTotalGamesLost', gamesLost);
    await prefs.setInt('LizardSpokTotalGamesDraw', gamesDraw);
  }

  @override
  Future syncDataWithProvider() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    gamesWon = prefs.getInt('LizardSpokTotalGamesWon') ?? 0;
    gamesLost = prefs.getInt('LizardSpokTotalGamesLost') ?? 0;
    gamesDraw = prefs.getInt('LizardSpokTotalGamesDraw') ?? 0;
  }
}
