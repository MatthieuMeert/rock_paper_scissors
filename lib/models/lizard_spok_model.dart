import 'package:rps/models/game_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LizardSpokModel extends GameModel {
  @override
  List<String> choicesList = ['rock', 'paper', 'scissors', 'lizard', 'spok'];

  @override
  String getDescription(String choice) {
    switch (choice) {
      case 'rock':
        return 'Rock crushes scissors and lizard, but gets covered by paper and vaporized by Spok';
      case 'paper':
        return 'Paper covers rock and disproves Spok, but gets cut by scissors and eaten by lizard';
      case 'scissors':
        return 'Scissors cuts paper and decapitates lizard, but gets crushed by rock and smashed by Spok';
      case 'lizard':
        return 'Lizard eats paper and poisons Spok, but gets crushed by rock and decapitated by scissors';
      case 'spok':
        return 'Spok smashes scissors and vaporizes rock, but gets poisoned by lizard and disproved by paper';
    }
    return 'Description missing';
  }

  @override
  addGameToStats() {
    if (choice == answer) {
      gamesDraw++;
    } else if (choice == 'rock' &&
            (answer == 'scissors' || answer == 'lizard') ||
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
