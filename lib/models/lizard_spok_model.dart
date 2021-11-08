class LizardSpokModel {
  List<String> choicesList = ['scissors', 'paper', 'rock', 'lizard', 'spok'];
  String? choice;
  String? answer;
  int gamesWon = 0;
  int gamesLost = 0;
  int gamesDraw = 0;

  LizardSpokModel();

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
}
